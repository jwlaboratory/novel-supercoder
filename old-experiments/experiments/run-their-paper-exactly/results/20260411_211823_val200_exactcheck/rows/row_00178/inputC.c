```c
#include<stdio.h>
int main()
{
  int c=0;
  double a,i=1.0;
  scanf("%lf",&a);
  if(a==0)
    printf("0\n");
  else{
  while(a>=i){
    i=i*2.0;
    c++;
  }
  printf("%d\n",c);
  }
  return 0;
  }```