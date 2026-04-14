```c
#include<stdio.h>

int main(){
  long n = 0;
  long maxi = 0;
  long i = 0;
  long remove = 0;
  scanf("%ld",&n);
  for(i=1;i<n;i++){
    if(((i+1)*i)/2 >= n){
      break;
    }
  }
  maxi = i;
  //printf("%ld",maxi);
  remove = (maxi*(maxi+1))/2 - n;
  //printf("%ld %ld ",maxi,remove);
  for(i=1;i<=maxi;i++){
    if(i != remove){
      printf("%ld\n",i);
    }
  }
  return 0;
}```