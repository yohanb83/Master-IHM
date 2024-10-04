

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define BSIZE 1024

__global__ void kvecsum1(unsigned* vec, int n){
    int idX = blockIdx.x*blockDim.x + threadIdx.x;
    int offset;
    for(offset=n/2; offset>0; offset/=2){
        if(idX<offset){
            vec[idX] += vec[idX+offset];
        }
        __syncthreads();
    }
}

void vecsum1(unsigned* vec, unsigned* sum, int size){
    unsigned* d_vec;
    int bytes = size*sizeof(unsigned);

    cudaMalloc((void**) &d_vec, bytes);
    cudaMemcpy(d_vec, vec, bytes, cudaMemcpyHostToDevice);
    kvecsum1<<<1, size>>>(d_vec, size);
    cudaMemcpy(sum, d_vec, sizeof(unsigned), cudaMemcpyDeviceToHost);
    cudaFree(d_vec);
}

void vecsum2(unsigned* vec, unsigned* sum, int size){
    unsigned *d_vec, *d_sum;
    int vec_bytes = size*sizeof(unsigned);
    int sum_bytes = (size/BSIZE)*sizeof(unsigned);

    cudaMalloc((void**) &d_vec, vec_bytes);
    cudaMalloc((void**) &d_sum, sum_bytes);

    cudaMemcpy(d_vec, vec, vec_bytes, cudaMemcpyHostToDevice);
    kvecsum1<<<1, size>>>(d_vec, size);
    cudaMemcpy(sum, d_vec, sizeof(unsigned), cudaMemcpyDeviceToHost);

    cudaMemcpy(d_sum, sum, sum_bytes, cudaMemcpyHostToDevice);
    kvecsum1<<<1, size/BSIZE>>>(d_sum, size/BSIZE);
    cudaMemcpy(sum, d_sum, sizeof(unsigned), cudaMemcpyDeviceToHost);

    cudaFree(d_vec); cudaFree(d_sum);
}

int main(int argc, char **argv) {
    if (argc < 2) {
        printf("Usage: <filename>\n");
        exit(-1);
    }
    unsigned int log2size, size;
    unsigned int *vec;
    FILE *f = fopen(argv[1], "r");
    fscanf(f, "%d\n", &log2size);
    if (log2size > 10) {
        printf("Size (%u) is too large: size is limited to 2^10\n", log2size);
        exit(-1);
    }
    size = 1 << log2size;
    unsigned int bytes = size * sizeof(unsigned int);
    vec = (unsigned int *) malloc(bytes);
    assert(vec);
    for (unsigned int i = 0; i < size; i++) {
        fscanf(f, "%u\n", &(vec[i]));
    }
    fclose(f);

    unsigned sum[1] = {0};
    vecsum1(vec, sum, size);
    printf("%u\n", sum[0]);

}
