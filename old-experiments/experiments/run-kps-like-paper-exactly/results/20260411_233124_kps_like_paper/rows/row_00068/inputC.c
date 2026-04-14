#include<stdio.h>
int main(){
  int N;
  float K;
  scanf("%d",&N);
  if(N%2 == 0){
    printf("0.5");
  }
  else{
    K = (N+1)/2.0/N;
    printf("%lf",K);
  }
}