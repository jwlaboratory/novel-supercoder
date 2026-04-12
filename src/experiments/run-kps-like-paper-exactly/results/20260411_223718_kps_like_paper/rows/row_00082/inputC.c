#include<stdio.h>

int main()
{
    long long int i,j,k,n;

    for(i=1;i<=9;i++){
        for(j=1;j<=9;j++){
            printf("%lldx%lld=%lld\n",i,j,i*j);

        }
    }
    return 0;
}