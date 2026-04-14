#include<stdio.h>

int main()
{
  int n, i, x;
  int d = 100;
  int flag = 0;
  
  scanf("%d", &n);
  
  x = n;
  
  for(i = 0; i < 3; i++)
  {
    x /= d;
    if(x == 7)
      flag = 1;
    
    n -= x * d;
    x = n;
    d /= 10;   
  }
  if(flag == 1)
    printf("Yes");
  
  else
    printf("No");
  
  return 0;
}