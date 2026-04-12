```c
#include <stdio.h>
#include <math.h>

int main(int argc, char** argv)
{
    int n,k;

    scanf("%d", &n);
    scanf("%d", &k);

    // log_k(n)
    // log(n)/log(k)
    printf("%d\n", (int)(log(n)/log(k))+1);

    return 0;
}
```