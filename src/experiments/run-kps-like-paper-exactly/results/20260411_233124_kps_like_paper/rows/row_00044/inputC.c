#include<stdio.h>

int main(){
  int s,n,sum=0;
  scanf("%d", &n)==1;
  int a[n],b[n];
  for(int i=0;i<n;i++){ 
    scanf("%d", &a[i])==1; 
  }
  for(int i=0;i<n;i++){ 
    scanf("%d", &b[i])==1; 
  }
  for(int i=0;i<n;i++){
    if(a[i] > b[i])
      sum += a[i] - b[i];
  }
  printf("%d", sum);
  return 0;
}