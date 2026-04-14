#include<stdio.h>
int main(){
  int a,b,count=0;
  for(a=1;a<10;a++){
    for(b=1;b<10;b++){
      count = a*b;
      printf("%dx%d=%d\n",a,b,count);
    }
  }
  return 0;
}