#include <stdio.h>

int main(void) {
  int a, b, c, k, i, max, sum;

  scanf("%d %d %d", &a, &b, &c);
  scanf("%d", &k);

  max = a;
  if (max < b) {
    max = b;
  }
  if (max < c) {
    max = c;
  }

  sum = (a + b + c) - max;

  for (i = 1; i <= k; i++) {
    max *= 2;
  }

  printf("%d\n", sum + max);

  return 0;
}
