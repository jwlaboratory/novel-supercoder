#include<stdio.h>
int main(void){
   int i,j,a;
   for(i=1;i<=9;i++){
      for(j=1;j<=9;j++){
         a=i*j;
         printf("%dx%d=%d\n",i,j,a);
      }
   }




return 0;
}