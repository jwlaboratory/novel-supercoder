#include<stdio.h>

int main ()
{
    long long n, i;

    for(n=1; n<=9; n++){
    for(i=1; i<=9; i++){
        printf("%lldx%lld=%lld\n", n, i, n*i);
    }
    }
    return 0;
}