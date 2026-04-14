#include<stdio.h>
int main()
{
    int n,i;
    for(n=1;n<=9;n=n+1){
            for(i=1;i<=9;i=i+1){
                 printf("%dx%d=%d\n",n,i,n*i);
    }
    }
    return 0;
    }