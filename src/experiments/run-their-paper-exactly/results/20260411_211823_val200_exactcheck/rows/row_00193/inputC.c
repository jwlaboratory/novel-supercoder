```c
#include <stdio.h>

int main(){
  long a, b;  scanf("%ld%ld", &a, &b);
  long ans = 0;
  long two = 1;
  while((b/a) >= two){
    ans++;
    two = two << 1;
  }
  printf("%ld\n", ans);
  return 0;
}
```