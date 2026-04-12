```c
#include <stdio.h>

int main(){
    int A, B, C, K;

    scanf("%d %d %d %d", &A, &B, &C, &K);

    while(K--){
        if (A >= B && A >= C){
            A = A*2;
        } else if (B >= C){
            B = B*2;
        } else {
            C = C*2;
        }
    }

    printf("%d\n", A+B+C);

    return 0;
}```