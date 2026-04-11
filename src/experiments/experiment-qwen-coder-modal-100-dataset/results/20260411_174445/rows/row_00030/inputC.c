#include<stdio.h>
#include<string.h>

int main(void){
  int i,l;
  char s[100];
  scanf("%s",s);
  l=strlen(s);
  printf("%c%d%c\n",s[0],l-2,s[l-1]);
  return 0;
}