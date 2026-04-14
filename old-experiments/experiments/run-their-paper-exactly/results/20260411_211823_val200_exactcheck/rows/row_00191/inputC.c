```c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

int main(void){

    int N;

    scanf("%d", &N);

    int a[N];
    int o = 0, t = 0, f = 0;

    for(int i = 0; i < N; i++){
        scanf("%d", &a[i]);
        if(a[i] % 4 == 0){
            f++;
        }else if(a[i] % 2 == 0){
            t++;
        }else{
            o++;
        }
    }

    if(f + 1 >= t + o){
        printf("Yes\n");
    }else if(o - f <= 0){
        printf("Yes\n");
    }else{
        printf("No\n");
    }

    return 0;
}```