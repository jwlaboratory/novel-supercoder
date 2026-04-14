#include <stdio.h>

int main(void){
int a,b;
for(a=1; a<=9; a++){
 for(b=1; b<=9; b++){
  printf("%d",a);
  printf("x%d=",b);
  printf("%d\n",a*b);
  } 
 }
return 0;
}