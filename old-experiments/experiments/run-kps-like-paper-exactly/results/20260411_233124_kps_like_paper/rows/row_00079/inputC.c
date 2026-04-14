#include<stdio.h>
 
int main(){
  int L,R,d;
  scanf("%d%d%d",&L,&R,&d);
  printf("%d",R/d-(L-1)/d);
  return 0;
}