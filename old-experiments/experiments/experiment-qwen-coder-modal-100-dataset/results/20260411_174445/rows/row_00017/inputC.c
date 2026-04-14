#include<stdio.h>
#include<string.h>

int main(void){
  char str[100001];
  int l,N,point=0,i;
  scanf("%s%*c",str);
  l=strlen(str);

  for(i=0;i<l;i++){
    if(i%2)
      point+=str[i]=='g';
    else
      point-=str[i]=='p';
  }
  printf("%d\n",point);
  return 0;
}
