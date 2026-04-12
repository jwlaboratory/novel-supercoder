```c
/*
  AOJ 
  title:#3128
  @kankichi57301
 */
#include <stdio.h>

int n;
int main()
{
  int i,c,c0,min_;
  scanf("%d ",&n);
  scanf("%d ",&c0);
  for(i=min_=1;i<n;i++)
    {
      scanf("%d",&c);
      if( c <= c0)
	min_++;
      c0=c;
    }

  printf("%d\n%d\n",min_,n);
 
  return(0);
}

```