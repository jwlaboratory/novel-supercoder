```c
/*
  AOJ #3026
  title:ai1333
  @kankichi57301
 */
#include <stdio.h>

char ans[104]="ai1333";
int main()
{
  int i,n;
  scanf("%d",&n);
  n /= 100;

  
  for(i=0;i<n;i++)
    ans[6+i]='3';
  ans[6+n]='\0';
  printf("%s\n",ans);
 
  return(0);
}

```