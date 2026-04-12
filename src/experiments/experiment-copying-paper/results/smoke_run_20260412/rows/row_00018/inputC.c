```c
#include <stdio.h>

int a[1000000];

int main () {
    int n, A;
    scanf("%d",&n);
    for(int i=2;i<=n;i++) {
        scanf("%d",&A);
        a[A]+=1;
    }
    for(int i=1;i<=n;i++) printf("%d\n",a[i]);
}```