```c
#include <stdio.h>

int main(){
  int l = 0;
  scanf("%d",&l);
  int n = 1;
  int m = 0;

  int tmp = l;
  while(tmp > 1){
    if(tmp%2==1){
      m = m+1;
    }
    tmp = tmp/2;
    n = n+1;
    m = m+2;
  }
  printf("%d %d\n",n,m);

  int i = 1;
  tmp = l;
  for(i=1;i<n;i++){
    printf("%d %d %d\n",i,i+1,(tmp+1)/2);
    printf("%d %d %d\n",i,i+1,0);
    if(tmp%2==1){
      printf("%d %d %d\n",i,n,tmp/2);
    }
    tmp = tmp/2;
  }
  return 0;
}
```