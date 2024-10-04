
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char **argv){
    if (argc < 4){
        printf("Usage: <log(size)> <maxval> <filename>\n");
        exit(-1);
    }
    int log2size = atoi(argv[1]);
    int max = atoi(argv[2]);
    FILE *f = fopen(argv[3],"w");
    fprintf(f,"%d\n",log2size);
    int size = 1 << log2size;
    srand(time(NULL));
    for (int i=0; i<size; i++){
        unsigned int x = rand() % (max+1);
        fprintf(f,"%u\n",x);
    }
    fclose(f);
}