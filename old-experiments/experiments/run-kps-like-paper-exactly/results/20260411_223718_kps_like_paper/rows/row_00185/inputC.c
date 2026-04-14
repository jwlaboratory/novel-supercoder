#include <stdio.h>

#define NUM 9

int main(void)
{
  int i, j;

  for (i = 1; i < NUM + 1; i++){
    for (j = 1; j < NUM + 1; j++){
      printf("%dx%d=%d\n", i, j, (i * j));
    }
  }

  return 0;
}