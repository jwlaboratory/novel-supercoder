#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX(a,b) (a > b ? a : b)
#define MIN(a,b) (a < b ? a : b)
const int inf = 1000000000; // 10^9

int main(){
   int x,y,z;scanf("%d%d%d",&x,&y,&z);
   printf("%d",(x-z)/(y+z));
}