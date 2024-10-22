import sys

from mpi4py import MPI


if __name__=="__main__":
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()

    if rank == 0:
        passnumber = sys.argv[1]
    else:
        passnumber = 0

    print(f"At start in process of rank {rank} the passnumber is {passnumber}")

    #collective process
    passnumber = comm.bcast(passnumber, root=0)

    print(f"After collective in process of rank {rank} the passnumber is {passnumber}")
