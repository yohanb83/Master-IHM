#!/usr/bin/python3
# coding: utf-8

# On reprend l'exercice sur la pandémie vu en TDs. Une épidémie de maladie infectieuse a été observée dans un certain nombre $ n $ de sites. Un ensemble de $m$ équipes de médecins doivent aller enquêter pour identifier la maladie, ce qui leur prend un certain temps $t_{ij}$ qui dépend du site $j$ et de l'équipe $i$. Chaque équipe peut enquêter au maximum sur 2 sites, et doit alors se déplacer du site $j_1$ au site $j_2$, ce qui prend un temps $d_{j_1j_2}$. 


# On veut minimiser le coût total en supposant que le coût des missions est proportionnel à la durée totale de travail (= temps de réalisation des missions + temps de déplacement entre deux sites s'il y a lieu)

from pyscipopt import Model
I = range(3) # les équipes
J = range(4) # les lieux

# temps d'intervention, t[i][j] pour i ∈ I, j ∈ J
t = [ [ 10 , 12 , 14 ,  5 ]
    , [  6 , 10 , 10 ,  4 ]
    , [ 12 , 12 , 16 ,  6 ] ]

# temps de chgt de lieux, d[j][k] pour j,k ∈ J. Matrice symmétrique.
d = [ [ 0 ,  6 ,  6 ,  8 ]
    , [ 6 ,  0 ,  7 ,  8 ]
    , [ 6 ,  7 ,  0 ,  5 ]
    , [ 8 ,  8 ,  5 ,  0 ] ]

# Initialisation du modèle
M = Model()


# Dictionnaire de var. bool.  : xij = 1 si equipe i va sur lieu j
x = {}
for i,j in itertools.product(I,J):
  x[i,j] = M.addVar(f"x{i}{j}",vtype="B") #

# Dict. de var. bool. : yijk = 1 is equipe i va sur lieu j et lieu k
y = {}
for i,j,k in itertools.product(I,J,J):
  y[i,j,k] = M.addVar(f"y{i}{j}{k}",vtype="B") #

# Contraintes
# Tout site est visité au moins une fois
for j in J : M.addCons(sum(x[i,j] for i in I) >= 1)
