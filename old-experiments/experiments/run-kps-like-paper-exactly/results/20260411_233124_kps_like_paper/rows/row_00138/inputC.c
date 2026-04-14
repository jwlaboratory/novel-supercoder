#include<stdio.h>
int main(void)
{
    int a,b,c,d;
    scanf("%d%d%d%d",&a,&b,&c,&d);
    while(a>0&&c>0)
    {
        c = c - b;
        if(c<0)
        break;
        a = a - d;
    }
    if(c<=0)
    printf("Yes");
    else
    {
        printf("No");
    }
    
}