```c
#include<stdio.h>

int main()
{
    int R;

    scanf("%d",&R);
    int Q;
    int maxi=0;
    int total = 0;
    for(int i=1;i<=R;i++)
    {
        scanf("%d",&Q);
        total+=Q;
        if(Q>maxi)
        {
        maxi=Q;
        }
    }
    if(total-maxi>maxi)
        printf("Yes\n");
    else
        printf("No\n");
    return 0;
}
```