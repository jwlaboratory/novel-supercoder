#include<stdio.h>

int min(int x,int y){
  if(x<y) return x;
  else return y;
}

int main(){
  int a,b,c,d;
  scanf("%d %d %d %d",&a,&b,&c,&d);
  printf("%d\n",min(a,b)+min(c,d));
}