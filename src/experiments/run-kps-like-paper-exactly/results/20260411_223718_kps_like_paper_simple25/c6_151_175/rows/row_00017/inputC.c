#include <stdio.h>
int main()
{
  int i,n;
  for(i=1;i<=9;i++)
  {
    for(n=1;n<=9;n++)
    {
      printf("%dx%d=%d\n",i,n,i*n);
    }
  }
  return 0;
}