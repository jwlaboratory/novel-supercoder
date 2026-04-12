#include <stdio.h>
#include <stdlib.h>

int main(void)
{
   int i,j,y;
   for(i=1;i<=9;i++){
    for(j=1;j<=9;j++){
        y=i*j;
        printf("%dx%d=%d\n",i,j,y);
    }
   }
    return 0;
}

