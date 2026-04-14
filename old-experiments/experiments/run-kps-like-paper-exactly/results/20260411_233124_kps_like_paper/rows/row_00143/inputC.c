#include<stdio.h>
int main(){
  int n;
  for(scanf("%d",&n);n>=0;n-=4)if(n%7==0){printf("Yes");return 0;}
  printf("No");
}
