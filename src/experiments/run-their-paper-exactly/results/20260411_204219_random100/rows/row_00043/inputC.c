```c
#include <stdio.h>
#include <stdlib.h>

int main(void) {

  long x,y;
  scanf("%ld %ld", &x, &y);
  long button;
  if (labs(y) >= labs(x)) {
    if (x >= 0 && y >= 0) {
      button = y-x;
    } else if (x >= 0 && y < 0) {
      button = 1-x-y;
    } else if (x < 0 && y >= 0) {
      button = 1+y+x;
    } else {
      button = 2+x-y;
    }
  } else {
    if (x >= 0 && y > 0) {
      button = 2+x-y;
    } else if (x >= 0 && y < 0) {
      button = 1+y+x;
    } else if (x >= 0 && y == 0) {
      button = 1+x-y;
    } else if (x < 0 && y > 0) {
      button = 1-y-x;
    } else {
      button = y-x;
    }
  }
  printf("%ld\n", button);

  return 0;
}```