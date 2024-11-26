# mpirun -n 3 python3 n-bodies-par.py 12 1000

import sys
import time
import random
import numpy as np
from mpi4py import MPI

from n_bodies import *

nbbodies = int(sys.argv[1])
NBSTEPS = int(sys.argv[2])
DISPLAY = len(sys.argv) != 4

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()


if rank==0:
    data = init_world(nbbodies)
    start_time = time.time()

else:
    data = None

data = comm.bcast(data, root=0)

chunk_size = nbbodies // size

for t in range(NBSTEPS):
    data_ = data[rank*chunk_size:rank*chunk_size+chunk_size]
    force = np.zeros((chunk_size, 2), dtype=np.float64)
    for i in range(chunk_size):
        for j in range(nbbodies):
            if (rank*chunk_size+i)!=j:
                force[i] += interaction(data_[i], data[j])
    for i in range(chunk_size):
        data_[i] = update(data_[i], force[i])  
    comm.Allgather(data_, data)   

if rank==0 and DISPLAY:
    displayPlot(data)

end_time = time.time()   

if rank==0:
    print("Duration:", end_time-start_time)
    print("Signature: %.4e" % (signature(data)))
    print("Unbalance: %d" % (100*(0)))
