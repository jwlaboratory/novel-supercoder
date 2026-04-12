#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define BUF 4
int main(void) {
  char num[BUF];
  scanf("%s", num);
  if (num[0] == '7' || num[1] == '7' || num[2] == '7') {
    printf("Yes\n");
  } else {
    printf("No\n");
  }

  return 0;
}
