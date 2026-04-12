```c
#include<stdio.h>
int main(void)
{
    int H,W,n,i;
    for(;;)
    {
        scanf("%d %d",&H,&W);
        
        if((H==0)&&(W==0)) break;
        
        for(n=0;n<H;n++)
        {
            for(i=0;i<W;i++)
            {
                printf("#");
            }
            printf("\n");
        }
        printf("\n");
    }
    return 0;
}
```