```c
#include <stdio.h>

int main(void){

  int n,k;
  scanf("%d %d", &n, &k);
  int max = (n+1)/2;
  if (k <= max) {
    printf("YES\n");
  } else {
    printf("NO\n");
  }

  return 0;
}```