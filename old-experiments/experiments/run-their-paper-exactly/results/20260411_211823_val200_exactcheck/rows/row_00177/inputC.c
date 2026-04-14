```c
#include <stdio.h>
#include <stdlib.h>

int main ()
{
  double n,ans;

  scanf("%lf", &n);

  if((int)n%2 == 0)
    ans = n / (n*2) ;
  else
    ans = 1-(n-1)/(2*n);

  printf("%lf",ans );
  return 0;
}
```