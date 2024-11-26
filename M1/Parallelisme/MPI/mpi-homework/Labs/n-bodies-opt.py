# python3 n-bodies-base.py 12 1000

import sys
import time
import random
import numpy as np
from mpi4py import MPI


from n_bodies import *

nbbodies = int(sys.argv[1])
NBSTEPS = int(sys.argv[2])
DISPLAY = len(sys.argv) != 4

#init mpi
comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()

#init données
chunk_size = nbbodies // size #tailles chunk / thread
data = np.empty((nbbodies, 6), dtype='f') #init data (attributs des objets)
data_ = np.empty((chunk_size, 6), dtype=np.float64) #init data partagée 
opt_idx = np.empty(size, dtype='i') #init nouvelle indexation

if (rank==0):
    start_time = time.time() #heure de début
    data = init_world(nbbodies) #création des objets
    """
    opt_idx recois un nouvel arrangement d'index des objets de data car en découpant de facon standard:
        exemple soit    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11   les 12 objets de la simulation
        pour 3 threads 
                 on a: | 0 1 2 3 | | 4 5 6 7 | | 8 9 10 11 |
        or on veut supprimer la symétrie donc on privilégie un traitement comme suit:
                       | 0 1 2 3 | | 4 5 6 7 | | 8 9 10 11 |
                         X X X X     X X X X     X X  X  X
                           X X X     X X X X     X X  X  X
                             X X     X X X X     X X  X  X
                               X     X X X X     X X  X  X
                                     X X X X     X X  X  X
                                       X X X     X X  X  X
                                         X X     X X  X  X
                                           X     X X  X  X
                                                 X X  X  X
                                                   X  X  X
                                                      X  X
                                                         X
        on vois que les threads peuvent avoir un nombre très différent de traitements
        on cherche donc a réarranger les index de facon a ce que chaque thread ait
        un nombre similaire de traitement
    """
    opt_idx = [] #nouvelle liste
    p = (nbbodies*(nbbodies-1)) // (2*size) #nombre de traitement optimal par thread
    tmp = 0
    for i in range(1,nbbodies): #  pour chaque objet
        tmp = (tmp%p) + i 
        if (tmp >= p): #si nombre d'itérations valides (inf à l'optimal)
            opt_idx += [i] #on rajoute l'objet  
    opt_idx = np.array(opt_idx, dtype='i') 
    
comm.Bcast(data, root=0) #partage des données de data
comm.Bcast(opt_idx, root=0) #partage des nouveaux index

#index de début pour chaque thread
if rank==0:
    start_idx=0
else:
    start_idx=opt_idx[rank-1]+1
#index de fin pour chaque thread
end_idx = opt_idx[rank]+1

for t in range(NBSTEPS): # pour chaque étape
    data_ = data[rank*chunk_size:rank*chunk_size+chunk_size] #séparation de data entre les thread
    force = np.zeros((nbbodies , 2), dtype=np.float64) #init force entre deux objets
    forces = np.zeros((nbbodies, 2), dtype=np.float64) #init total des forces calc par le thread
    for i in range(start_idx, end_idx): #pour chaque objets pris en charge par le thread
        for j in range(i): #pour tous les autres objets sans symétrie
            forceji = interaction(data[i], data[j]) #calcul de l'interaction
            force[i] += forceji 
            force[j] -= forceji 
    comm.Allreduce(force, forces, op=MPI.SUM) #somme des forces 

    #update de chaque objet
    for i in range(chunk_size):
        global_idx = rank*chunk_size + i
        data_[i] = update(data_[i], forces[global_idx])
    #gather de toutes les données dans data
    comm.Allgather(data_, data)

#affichage graphique
if (rank==0 and DISPLAY):
    displayPlot(data)

#affichage sortie std
if (rank==0):
    end_time = time.time()
    print("Duration:", end_time-start_time)
    print("Signature: %.4e" % (signature(data)))
    print("Unbalance: %d" % (100*(0)))
