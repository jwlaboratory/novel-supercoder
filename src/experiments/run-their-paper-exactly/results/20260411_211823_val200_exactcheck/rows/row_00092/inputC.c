```c
#include<stdio.h>
int main(){
  long int i,x,y;
  scanf("%ld%ld",&x,&y);
  for(i=0;x<<i<=y;i++);
  printf("%ld",i);
}
```