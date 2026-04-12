```c
#include<stdio.h>
int main()
{
    int n,i,in,a=0,p=0,u;
    scanf("%d",&n);
    for(i=1;i<=n;i++)
    {
        scanf("%d",&in);
        p+=in;
        if(in>a)
        a=in;
    }
    u=p-a+(a/2);
    printf("%d\n",u);
    return 0;
}```