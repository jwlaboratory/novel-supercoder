```c
#include<stdio.h>

int main(void){
  int n;
  int a[100000];
  int dif[99999] = {0};
  scanf("%d", &n);
  for(int i=0; i<n; i++){
    scanf("%d", &a[i]);
    dif[a[i]] ++;
  }

  int i_0;
  if(n%2 == 0){
    i_0 = 1;
  }else{
    i_0 = 0;
  }
  for(int i=i_0; i<n; i+=2){
    if(i == 0){
      if(dif[0] != 1){
        printf("%d\n", 0);
        return 0;
      }
    }else if(dif[i] != 2){
      printf("%d\n", 0);
      return 0;
    }
  }

  int ans = 1;
  for(int i=0; i<n/2; i++){
    ans *= 2;
    ans %= 1000000007;
  }

  printf("%d\n", ans);

  return 0;
}
```