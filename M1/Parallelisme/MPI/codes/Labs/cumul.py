# python3 cumul.py 1000

# parallel_cumul.py

import sys
from mpi4py import MPI

def cumul(a, b):
    """Compute the sum of all integers between a (inclusive) and b (exclusive)."""
    return sum(range(a, b))

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: mpiexec -n <num_processes> python3 parallel_cumul.py <N>")
        sys.exit(1)

    # Initialize MPI
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()
    size = comm.Get_size()

    # Read the argument N
    N = int(sys.argv[1])

    # Determine the range [a, b) for each process
    chunk_size = N // size
    a = rank * chunk_size
    b = a + chunk_size

    # Compute the partial sum for this process
    local_sum = cumul(a, b)

    # Reduce the local sums to the root process
    total_sum = comm.reduce(local_sum, op=MPI.SUM, root=0)

    # Print the result on the root process
    if rank == 0:
        print(f"The sum of the first {N} integers is {total_sum}")
