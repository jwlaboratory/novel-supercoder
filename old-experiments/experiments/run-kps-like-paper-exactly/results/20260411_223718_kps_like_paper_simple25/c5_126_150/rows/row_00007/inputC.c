#include <stdio.h>

int main(void){
 int a,b;

 for(a=1;a<=9;a++){
  for(b=1;b<=9;b++){
   printf("%dx%d=%d\n",a,b,a*b);
  }
 }

 return 0;
}