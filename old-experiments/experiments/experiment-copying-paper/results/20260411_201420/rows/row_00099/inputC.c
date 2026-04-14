```c
/* SPDX-License-Identifier: X11
 *
 * Copyright 2020 Elias Yuan <a@jthv.ai>, MIT/X11 License
 *   https://jthv.ai/LICENSE/X11.txt
 *
 * ANU-CPC Complexity Workshop - A: Two Integers
 *   2020-04-13
 */

#include <stdio.h>

int main(void)
{
  unsigned long x,y;
  scanf("%lu %lu",&x,&y);

  if (x < y) {
    printf("%lu\n",x);
    return 0;
  }

  if (x % y == 0) {
    printf("-1\n");
    return 0;
  }

  printf("%lu\n",x);
  return 0;
}```