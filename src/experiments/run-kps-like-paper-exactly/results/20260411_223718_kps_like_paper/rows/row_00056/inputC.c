#include <stdio.h>
int main()
{
    int i,b,c;
    for(i=1;i<=9;i++){
        for(b=1;b<=9;b++){
            c=i*b;
            printf("%dx%d=%d\n",i,b,c);
            }
        }
    return 0;
}