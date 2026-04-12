```c
#include<stdio.h>

int max(int a,int b){
  if(a>=b){
    return a;
  }else{
    return b;
  }
}

int amax(int a,int b,int c){
  int s=max(a,b);
  int q=max(s,c);
  return q;
}

int main(void){
  int a,b,c;
  scanf("%d %d %d",&a,&b,&c);
  printf("%d\n",amax(10*a+b+c,10*b+a+c,10*c+a+b));
  return 0;
}```