#include<stdio.h>
int main()
{
    int k,a,b;
    scanf("%d",&k);
    scanf("%d%d",&a,&b);
    int i=(b/k)*k;
        if(i>=a)
           printf("OK\n");
        else
       printf("NG\n");
    return 0;
}