# python3 max_pos.py

import numpy as np
from mpi4py import MPI

def get_max(tab):
    pos = np.argmax(tab)
    return [tab[pos], pos]

SIZE=12

if __name__ == "__main__":
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()
    size = comm.Get_size()

    if rank==0:
        tab = np.random.randint(100, size = SIZE, dtype='i')
    else:
        tab = None
    
    subsize = size // SIZE

    c_max, c_pos = get_max(tab)
    
    
    print(c_pos)

