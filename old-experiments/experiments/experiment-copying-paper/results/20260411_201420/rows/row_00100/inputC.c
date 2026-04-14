```c
#include <stdio.h>
#include <stdlib.h>

int main (void) {
    int n;
    scanf("%d", &n);
    long int a[n + 1];

    if (n == 1 || n == 2) {
        printf("0\n");
    } else {
        a[0] = 1;
        a[1] = 0;
        a[2] = 0;
        for (int i = 3; i <= n; i++) {
            a[i] = a[i - 1] + a[i - 3];
            if (a[i] >= 1000000007) {
                a[i] %= 1000000007;
            }
        }
        printf("%ld\n", a[n]);
    }
    return 0;
}```