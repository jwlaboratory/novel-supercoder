```c
#include <stdio.h>
#include <math.h>
int main(void){
    int n;
    long long power=1;
    scanf("%d", &n);
    for(int i=1; i<=n; i++) power=(power*i)%(long long)(pow(10, 9)+7);
    printf("%lld", power);
    return 0;
}```