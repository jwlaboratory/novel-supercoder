```c
#include<stdio.h>
int main()
{
    int a,b,x,y;
    scanf("%d%d",&a,&b);
    if(a>=b)
    {
        x=a;
        a=a-1;
        if(a>=b)
        {
            y=a;
        }
        else
        {
            y=b;
        }
    }
    else
    {
        x=b;
        b=b-1;
        if(b>=a)
        {
            y=b;
        }
        else
        {
            y=a;
        }
    }

    printf("%d",x+y);
    return 0;
}

```