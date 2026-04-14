#include <stdio.h>
#include <stdlib.h>

/* constant */

#define MAX_N   (30)
#define MAX_C   (30)
#define NUM_L   (1 << 16)

/* typedef */

/* global variables */

static int n, c;
static int as[MAX_N], bs[MAX_C];

static int mscache[MAX_N][NUM_L];

/* subroutines */

int count_bits(int bits) {
  int c = 0;

  while (bits != 0) {
    if (bits & 1) c++;
    bits >>= 1;
  }

  return c;
}

int max_score(int k, int prev_l) {
  int bl, cur_l, i, l, max_sc, sc;

  if (k >= n) return 0;
  if (mscache[k][prev_l] >= 0) return mscache[k][prev_l];

  cur_l = prev_l | as[k];
  max_sc = 0;

  for (i = 0; i < c; i++) {
    bl = (cur_l & bs[i]);
    l = cur_l ^ bl;

    sc = count_bits(bl) + max_score(k + 1, l);

    if (max_sc < sc) max_sc = sc;
  }

  return (mscache[k][prev_l] = max_sc);
}

/* main */

int main(int argc, char **argv) {
  int b, i, j, k, ms;

  for (;;) {
    scanf("%d%d", &n, &c);
    if (n == 0 && c == 0) break;

    for (i = 0; i < n; i++) {
      k = 0;
      for (j = 0; j < 16; j++) {
        scanf("%d", &b);
        k = (k << 1) | b;
      }

      as[i] = k;
    }

    for (i = 0; i < c; i++) {
      k = 0;
      for (j = 0; j < 16; j++) {
        scanf("%d", &b);
        k = (k << 1) | b;
      }

      bs[i] = k;
    }

    for (i = 0; i < n; i++)
      for (j = 0; j < NUM_L; j++)
        mscache[i][j] = -1;

    ms = max_score(0, 0);
    printf("%d\n", ms);

  }

  return 0;
}