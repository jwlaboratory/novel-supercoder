#include<stdio.h>
#define M 9
#define N 9
int main(){
  int i,j;
  for(i=0;i<M;i++){
    for(j=0;j<N;j++){
      printf("%dx%d=%d\n",i+1,j+1,(i+1)*(j+1));
    }
  }
  return 0;
}