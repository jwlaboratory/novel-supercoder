```c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
int main(void)
{
    int N;
    int K;
    int x[100];
    int i;
    int ret = 0;
    scanf("%d",&N);
    scanf("%d",&K);
    for(i=0;i<N;i++){
        scanf("%d ",&(x[i]));
        if(x[i]<=(K/2)){
            ret = ret + x[i]*2;
        }else{
            ret = ret + ( K - x[i]) * 2;
        }
        //printf("X:%d\n",x[i]);
    }
    printf("%d\n",ret);

    return 0;
}
```