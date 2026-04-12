#include<stdio.h>

int main(){
  int a,b,c[251],n;

  scanf("%d",&n);

  for(a = 1; a <= n; a++){
    scanf("%d",&c[a]);
  }

  for(a = 1; a <= n; a++){
    printf("node %d: key = %d, ",a,c[a]);
    if(a != 1){
      printf("parent key = %d, ",c[a/2]);
    }
    if(2*a <= n){
      printf("left key = %d, ",c[2*a]);
    }
    if(2*a+1 <= n){
      printf("right key = %d, ",c[2*a+1]);
    }
      printf("\n");
  }
    return 0;
 }

