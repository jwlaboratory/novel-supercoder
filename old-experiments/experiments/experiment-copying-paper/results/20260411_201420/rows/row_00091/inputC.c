```c
#include <stdio.h>

int main()
{
    int N;
    scanf("%d", &N);
    int a[N];
    int all = 0;
    for (int i = 0; i < N; i++)
    {
        scanf("%d", &a[i]);
        all ^= a[i];
    }

    for (int i = 0; i < N; i++)
        printf("%d ", a[i] ^ all);
    puts("");
}```