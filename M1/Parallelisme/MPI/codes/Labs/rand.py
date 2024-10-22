import sys
import numpy as np

from mpi4py import MPI


if __name__ == "__main__":
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()


    # try with and without commenting the next line
    #np.random.seed(0)
    numbers = np.random.randint(100, size=10, dtype='i')

    n_max = np.max(numbers)
    n_min = np.min(numbers)

    all_min = comm.gather(n_min, root=0)
    all_max = comm.gather(n_max, root=0)

    n_min1 = [np.min(numbers)]*comm.Get_size()

    if rank==0:
        print(all_min, np.array_equal(all_min, n_min1))
    #print(numbers, n_min, n_max, np.array_equal(n_min, n_max))



