```c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

int f(int X){
    int s = 0;
    while(X > 0){
        s += X % 10;
        X /= 10;
    }
    return s;
}

int main(void){

    int N;

    scanf("%d", &N);

    if(N % f(N) == 0){
        printf("Yes\n");
    }else{
        printf("No\n");
    }

    return 0;
}```