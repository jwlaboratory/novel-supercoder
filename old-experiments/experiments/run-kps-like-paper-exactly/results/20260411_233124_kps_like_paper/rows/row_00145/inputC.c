#include<stdio.h>
int main()
{
    int x,y,z;
    scanf("%d%d%d",&x,&y,&z);
    if(x>=y&&y>=z)
    {
        printf("%d",x-z);
    }
    else if(x>=z&&z>=y)
    {
        printf("%d",x-y);
    }
    else if(y>=z&&z>=x)
    {
        printf("%d",y-x);
    }
    else if(y>=x&&x>=z)
    {
        printf("%d",y-z);
    }
    else if(z>=y&&y>=x)
    {
        printf("%d",z-x);
    }
    else if(z>=x&&x>=y)
    {
        printf("%d",z-y);
    }
    return 0;
}
