```c
#include<stdio.h>

int main(){
  int i=1,x;

  while (1){
    scanf("%d\n", &x);
    if(x==0){
      break;
    }
    else{
      printf("Case %d: %d\n", i,x);
      i++;
    }
  }

  return 0;
}
```