```c
#include<stdio.h>
#include<string.h>
int main(void){
char s[11];
  scanf("%s",&s);
  
 for(int i=0;i<strlen(s);i+=2){
   if(s[i]!='h'||s[i+1]!='i'){
printf("No");
     return 0;
   }
 }
printf("Yes");
  
  return 0;
}```