#include <stdio.h>
#include <ctype.h>

int main()
{
 int i,dem[26]={};
  char array[26]={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
 char c;
while(scanf("%c",&c)!=EOF){
  c = tolower(c);
 for(i=0;i<26;i++)
 {if (c==array[i]) dem[i]++;}
}
for (i = 0; i < 26; i++)
    printf("%c : %d\n", 'a' + i, dem[i]);
 return 0;
}