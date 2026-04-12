```c
#include <stdio.h>

int min(int a, int b)
{
  return a > b ? b : a;
}

int main()
{
  int a,b,k,i,count=0,ans;

  scanf("%d%d%d", &a,&b,&k);

  for(i=min(a,b); i>0; i--)
  {
    if(a%i ==0 && b%i ==0)
      count++;

    if(count == k){
      ans = i;
      break;
    }
  }
  printf("%d", ans);

  return 0;
}
```