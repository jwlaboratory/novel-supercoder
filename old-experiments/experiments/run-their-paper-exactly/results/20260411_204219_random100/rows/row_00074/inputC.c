```c
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

struct tuple {
    int x;
    int y;
};

int asc(const void *a, const void *b) {
    return ((struct tuple *)a)->y - ((struct tuple *)b)->y;
}


int main(void){
    int N;
    int x,l;
    scanf("%d", &N);
    struct tuple A[1000000+10];
    for (int i = 0; i < N; i++) {
        scanf("%d %d", &x, &l);
        A[i].x = x - l;
        A[i].y = x + l;
    }
    qsort(A,N,sizeof (struct tuple), asc);
    int now = -1100000000;
    int cnt = 0;
    for (int i = 0; i < N; i++) {
        if (now <= A[i].x) {
            now = A[i].y;
            cnt++;
        }
    }
    printf("%d\n",cnt);
}
```