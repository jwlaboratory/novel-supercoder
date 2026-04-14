#include<stdio.h>

int main(){
  int a;
  int num=0;
  int k;
  char s;
  char str[10000];
  int i;
  scanf("%d",&a);

  for(i=0;i<a;i++){
    scanf("%s %d",str,&k);
    if(str[1]==0){
      if(str[0]=='(') num+=k;
      else if(str[0]==')') num-=k;
    }
    if(num<0){
      break;
    }
  }
  puts(num==0?"YES":"NO");

  return 0;
}