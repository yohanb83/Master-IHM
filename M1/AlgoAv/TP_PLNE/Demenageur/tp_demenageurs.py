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

from pyscipopt import Model

def lecture(filename):
    """Question 6.4"""
    with open(filename, "r") as f:
        f.readline() #saut du nom
        cn = f.readline().split()
        capa, n = int(cn[0]), int(cn[1])
        objSize = f.readlines()
        for i in range(n):
            objSize[i] = int(objSize[i].strip())
    return capa, objSize

def traitement(filename=None, sym=False):
    """Question 6.3 - partie 1"""
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
    if sym:
        traitement_sym(M, I, J, C, objSize)
    else:
        traitement_nosym(M, I, J, C, objSize)

def traitement_sym(M, I, J, C, objSize):
    """https://jmsallan.netlify.app/blog/breaking-symmetry-in-linear-programming-formulation/"""
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
    print("Nombre de boites ->", M.getObjVal())
    print("Affichage de la repartition dans les boites indisponible")


def traitement_nosym(M, I, J, C, objSize):
    """Question 6.3 - partie 2"""
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
    #Resolution
    M.optimize()
    #Output
    print("Nombre de boites ->", M.getObjVal())
    for j in J:
        if M.getVal(y[j])==1:
            print(f"Boîte {j+1} -> objets ", [i+1 for i in I if M.getVal(x[i, j])==1])


if __name__ == "__main__":
    traitement("u40_00.bpa", sym=True)