```c
#include<stdio.h>
int main(){
  long int h,w;
  scanf("%ld%ld",&h,&w);
  printf("%ld",h==1?w==1?1:w-2:w==1?h-2:(w-2)*(h-2));
}
```