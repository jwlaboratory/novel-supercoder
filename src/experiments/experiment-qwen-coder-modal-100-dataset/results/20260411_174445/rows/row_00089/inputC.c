#include <stdio.h>
 
int n ,k, i, c, p;
int main() {
  scanf("%d%d\n", &n, &k); k = n + 2 * k;
  while(i++ < n) if((c = getchar_unlocked()) != p) k-- , p = c;
  printf("%d\n", k < n ? k : n - 1);
  return 0;
}
