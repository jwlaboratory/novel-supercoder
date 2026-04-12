```c
#include<stdio.h>

int main(void){
  int A,B,C,D,count;
  scanf("%d %d %d %d",&A,&B,&C,&D);
  do{
    C-=B;
    if(C<=0){
      count=1;
      break;
    }
    A-=D;
    if(A<=0){
      count=0;
      break;
    }
  }while(A>0&&C>0);
  
  if(count)
    printf("Yes");
  else
    printf("No");
  
  return 0;
}```