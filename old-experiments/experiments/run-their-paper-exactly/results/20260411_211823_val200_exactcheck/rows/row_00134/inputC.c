```c
#include <stdio.h>
int main(){
  int n, tmp=0, cnt[10000+1]={0};
  scanf("%d", &n);
  for(int x=1; x<=100; x++){
    for(int y=1; y<=100; y++){
      for(int z=1; z<=100; z++){
        tmp = x*x + y*y + z*z + x*y + y*z + z*x;
        if( tmp <= 10000 ){ cnt[tmp]++; }
      }
    }
  }
  for(int i=1; i<=n; i++){ printf("%d\n",cnt[i]); }
  return 0;
}
```