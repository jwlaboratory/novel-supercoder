```c
#include <stdio.h>

int main(void) {

  long n;
  scanf("%ld", &n);
  long a[n];
  for (long i = 0; i < n; i++) {
    scanf("%ld", &a[i]);
  }
  long pairs = a[0]/2;
  a[0] %= 2;
  for (long i = 1; i < n; i++) {
    if (a[i-1] == 1 && a[i] >= 1) {
      pairs++;
      a[i]--;
    }
    pairs += a[i]/2;
    a[i] %= 2;
  }
  printf("%ld\n", pairs);

  return 0;
}```