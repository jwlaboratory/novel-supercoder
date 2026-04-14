#include<stdio.h>
int main()
{
    int a,b,k,s,f;
    scanf("%d %d",&a,&b);
    k=(a+b)/2;
    s=abs(a-k);
    f=abs(b-k);

    if(s==f&&a!=b)
    {
        printf("%d\n",k);
    }
    else
    {
        printf("IMPOSSIBLE\n");
    }
    return 0;
}