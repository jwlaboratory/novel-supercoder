```c
#include <stdio.h>

int main()
{
    long long a, b, n;
    scanf("%lld %lld %lld", &a, &b, &n);
    
    printf("%lld", ((n < b) ? (a * n / b) : (a * (b - 1) / b)));
    return 0;
}```