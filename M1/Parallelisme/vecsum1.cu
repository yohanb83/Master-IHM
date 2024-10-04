
#include <stdio.h>
#include <stdlib.h>

__global__ void kvecsum1(unsigned* vec, int n){
    int idX = threadIdx.x;
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


int main(void){
    exit(0);
}
