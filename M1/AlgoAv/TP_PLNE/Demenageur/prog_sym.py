import sys
import numpy as np
from pyscipopt import Model, quicksum

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

def traitement(filename=None):
    if filename==None:
        #Donnees
        C = 9
        objSize = [6, 6, 5, 5, 5, 4, 4, 4, 4, 2, 2, 2, 2, 3, 3, 7, 7, 5, 5, 8, 8, 4, 4, 5]
    else:
        C, objSize = lecture(filename)  
    n = len(objSize)
    I = range(n)
    J = range(n)
    objSize = sorted(objSize, reverse=True)
    #Initialisation
    M = Model()
    #Variables
    u = {}
    for i in I:
        for j in J:
            u[i, j] = M.addVar(f"u{i}{j}", vtype="B")
    #Objectif 
    M.setObjective(sum(u[i, i] for i in I), "minimize")
    #Contraintes
    for j in J:
        M.addCons(sum(u[i, j] for i in J) == 1)   
    for i in I:
        M.addCons(sum(objSize[j] * u[i, j] for j in J) <= C * u[i, i])
    M.optimize()

if __name__ == "__main__":
    traitement("u60_00.bpa")
