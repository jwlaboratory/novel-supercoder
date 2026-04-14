```c
#include<stdio.h>
#include<math.h>
int main(){
char s[100001];
scanf("%s",s);
int i,j;
for(i=j=0;s[i+1]!='\0';i++)j+=s[i]!=s[i+1];
printf("%d",j);
}```