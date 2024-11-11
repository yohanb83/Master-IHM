#Yohan BOHEC
#Compte rendu TP PLNE
#Exercice 6 - Déménageurs

#Question 6.1 : Le nombre d'objets est un majorant du nombre de boites necessaires
#car on pourrait mettre un seul objet par boite, ce qui utiliserais
#le maximum de boites (24)

#Question 6.2 : 
#Variables:
# - Xij = 1 si objet i dans boite j, 0 sinon
# - Yj = 1 si boite j est utilisée, 0 sinon
#Objectif
# - Minimiser somme(Y.j, j de 1 à n)
#Contraintes
# 1) Chaque objet doit etre dans une seule boite
#      somme(X.ij, j de 1 à n) = 1 pour tout i de 1 à n
# 2) Une boite est utilisée si elle contient au moins un objet
#      X.ij <= Y.j, pour tout i de 1 à n, pour tout j de 1 à n
# 3) La somme des tailles des objets d'une boite doit etre
#    inferieure à la capacité de la boite
#      somme(t.i*X.ij, i de 1 à n) <= C*Y.j, pour tout j de 1 à n

import sys
import numpy as np
from pyscipopt import Model

#Question 6.4 :
def lecture(filename):
    with open(filename, "r") as f:
        f.readline() #saut du nom
        cn = f.readline().split()
        capa, n = int(cn[0]), int(cn[1])
        objSize = f.readlines()
        for i in range(n):
            objSize[i] = int(objSize[i].strip())
    return capa, objSize

#Question 6.3 :
def traitement(filename=None):
    if filename==None:
        #Donnees
        C = 9
        objSize = [6, 6, 5, 5, 5, 4, 4, 4, 4, 2, 2, 2, 2, 3, 3, 7, 7, 5, 5, 8, 8, 4, 4, 5]
    else:
        C, objSize = lecture(filename)
    I = range(len(objSize))
    J = range(len(objSize))
    objSize = sorted(objSize, reverse=True)
    #Initialisation
    M = Model()
    #Variables
    x = {} #Xij = 1 si objet i dans boite j, 0 sinon
    for i in I:
        for j in J:
            x[i, j] = M.addVar(f"x{i}{j}", vtype="B")
    y = {} #Yj = 1 si boite j utilisée, 0 sinon
    for j in J:
        y[j] = M.addVar(f"y{j}", vtype="B")
    #Objectif : Minimiser Yj le nombre de boites utilisées
    M.setObjective(sum(y[j] for j in J), "minimize")
    #Contraintes
    # 1) Chaque objet doit etre placé dans exactement une boite
    for i in I:
        M.addCons(sum(x[i, j] for j in J) == 1)
    # 2) Une boite est utilisé si elle contient au moins un objet
    for i in I:
        for j in J:
            M.addCons(x[i, j] <= y[j])
    # 3) la somme des objet d'une boite ne doit pas dépasser la capacité
    for j in J:
        M.addCons(sum(objSize[i] * x[i, j] for i in I) <= C*y[j])
    # 4) symetrie
    for j in J[1:]:
        M.addCons(y[j] - y[j-1] <= 0)


    #Resolution
    M.optimize()
    #Output
    print("Nombre de boites ->", M.getObjVal())
    for j in J:
        if M.getVal(y[j])==1:
            print(f"Boîte {j+1} -> objets ", [i+1 for i in I if M.getVal(x[i, j])==1])

if __name__ == "__main__":
    traitement("u60_00.bpa")



