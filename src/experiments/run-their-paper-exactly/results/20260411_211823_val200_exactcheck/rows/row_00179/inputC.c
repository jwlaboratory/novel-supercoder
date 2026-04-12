```c
#include <stdio.h>
#include <math.h>

int main(void) {

  long n;
  scanf("%ld", &n);
  long max = sqrt(n*2);
  long sum = max*(max+1)/2;
  while (sum < n) {
    max++;
    sum += max;
  }
  for (long i = 1; i <= max; i++) {
    if (sum-n == i) {
      continue;
    }
    printf("%ld\n", i);
  }

  return 0;
}```