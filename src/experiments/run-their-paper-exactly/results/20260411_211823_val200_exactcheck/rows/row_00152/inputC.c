```c
#include<stdio.h>

int main(void)
{
  int a,b;
  scanf("%d%d",&a,&b);

  int hd = b-a;
  int i,h = hd;
  for(i=0;i<hd;i++)
    h += i;

  printf("%d\n",h-b);
  return 0;
}
```