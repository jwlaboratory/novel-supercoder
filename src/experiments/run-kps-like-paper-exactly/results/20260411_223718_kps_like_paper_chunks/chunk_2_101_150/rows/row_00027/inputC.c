#include<stdio.h>
int main()
{
  int num;
  int i,j;
  for(i=1;i<10;i++){
    for(j=1;j<10;j++){
      num=i*j;
      printf("%dx%d=%d\n",i,j,num);
    }
  }
return 0;
}