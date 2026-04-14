#include <stdio.h>
#define NUM 9

int main(){
  int i, j;

  for(i=1; i<=NUM; i++)
    for(j=1; j<=NUM; j++)
      printf("%dx%d=%d\n",i,j,i*j);
      
  return 0;
}