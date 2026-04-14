```c
#include<stdio.h>
int main()
{
    int a,i,n;
    scanf("%d%d",&n,&a);
    if(a==0)
        {
        if(n%500==0)
                {
                printf("Yes");
                }
        else
               {
                printf("No");
               }
        }
    else if(a>0 && a<=1000)
    {
        i=n%500;
        if(i<=a)
            {
            printf("Yes");
           }
        else
            {
            printf("No");
            }
    }
    return 0;
}
```