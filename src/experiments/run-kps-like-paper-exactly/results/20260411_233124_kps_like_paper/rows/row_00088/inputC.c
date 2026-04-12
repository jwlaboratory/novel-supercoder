#include <stdio.h>

int main(){
  int A,B;
  scanf("%d %d",&A,&B);
  if(A>=13) B=B;
  else if(A>=6) B/=2;
  else B=0;
  printf("%d\n",B);
  return 0;
}