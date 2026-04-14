#include <stdio.h>
#define max(X, Y) ((X) > (Y) ? (X) : (Y))

int sum(int arr[]);

int main()
{
    int a[4];
    int b[4];

    for (int i = 0; i < 4; i++) {
        scanf("%d", &a[i]);
    }
    for (int i = 0; i < 4; i++) {
        scanf("%d", &b[i]);
    }

    printf("%d\n", max(sum(a), sum(b)));
    
    return 0;
}

int sum(int arr[])
{
    int s = 0;
    for (int i = 0; i < 4; i++) {
        s = s + arr[i];
    }

    return s;
}

