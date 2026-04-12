```c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

int main(void){

    int X, t;

    scanf("%d%d", &X, &t);

    if(t > X){
        printf("0\n");
    }else{
        printf("%d\n", X - t);
    }

    return 0;
}```