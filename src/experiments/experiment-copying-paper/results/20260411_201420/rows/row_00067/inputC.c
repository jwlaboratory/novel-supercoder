```c
#include<stdio.h>
int main(void)
{
    int r, g, b, k = 0;
    scanf("%d", &r);
    scanf("%d", &g);
    scanf("%d", &b);

    k = 100 * r + 10 * g + b;

    if (k % 4 == 0) {
        printf("YES");
    }
    else {
        printf("NO");
    }
    return 0;
}```