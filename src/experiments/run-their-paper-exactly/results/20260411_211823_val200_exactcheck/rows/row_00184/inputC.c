```c
#include <stdio.h>

int main()
{
    long long n, k, i; 
    long long min, max;
    long long num = 0;
    scanf("%lld%lld", &n, &k);

    for (i = k; i <= n + 1; i++) {
        min = (i * (i-1) / 2);
        max = ((2*n-i+1) * i / 2);
        num += max - min + 1;
    }

    printf("%lld\n", num % 1000000007);

    return 0;
}```