# python3 teams.py

import numpy as np
from mpi4py import MPI


if __name__ == "__main__":
    # Initialize MPI
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()
    size = comm.Get_size()

    if rank == 0:
        teams = np.random.randint(2, size=size, dtype='i')
        print(f"The file contains {teams}")
    else:
        teams = None

    local_teams = np.zeros(1, dtype="i")
    comm.Scatter(teams, local_teams, root=0)

    if local_teams[0]==1:
        team="green"
    elif local_teams[0]==0:
        team="blue"
    print(f"I am {rank} and my team is {team}")