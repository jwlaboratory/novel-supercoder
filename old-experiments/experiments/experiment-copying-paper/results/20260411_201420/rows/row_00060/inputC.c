```c
#include<stdio.h>
int main(){
  int n,m,i;
  scanf("%d%d",&n,&m);
  int gcd=m/n;
  for(i=gcd;i>0;i--){
    if(m%i==0){
      printf("%d\n",i);
      return 0;
    }
  }
  return 0;
}
```