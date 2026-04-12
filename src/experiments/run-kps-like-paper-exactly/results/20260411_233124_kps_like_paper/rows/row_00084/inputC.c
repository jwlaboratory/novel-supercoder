#include <stdio.h>

int main()
{
  int a,b;
  scanf("%d %d",&a,&b);
  if((a-2*b)>=0)printf("%d\n",a-2*b);
  else printf("0\n");

  return 0;
  
}