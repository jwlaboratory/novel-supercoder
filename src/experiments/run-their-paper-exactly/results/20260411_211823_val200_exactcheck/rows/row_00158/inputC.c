```c
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <stdbool.h>
int main(){
    int i,j,k;
    scanf("%d %d %d",&i,&j,&k);
    if (i>=k && i>=j) printf("%d\n",10*i+j+k);
    else if (j>=i && j>=k) printf("%d\n",10*j+i+k);
    else printf("%d\n",10*k+i+j);
    return 0;
}```