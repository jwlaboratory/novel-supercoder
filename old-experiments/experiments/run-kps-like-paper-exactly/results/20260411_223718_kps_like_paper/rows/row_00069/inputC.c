#include<stdio.h>
int main()
{
    int n,i;
    for(n=1;n<=9;n++){
        for(i=1;i<=9;i++){
            printf("%dx%d=%d\n",n,i,n*i);
        }
    }
    return 0;
}