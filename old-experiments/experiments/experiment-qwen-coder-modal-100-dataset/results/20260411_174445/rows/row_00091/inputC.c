#include<stdio.h>
#define NMAX 200000
int UF_find(int, int*);
int main(void)
{
  int i, j, n, k, l, rdgrp = 0;
  int droot[NMAX], troot[NMAX], dleaf[NMAX], dnext[NMAX], trgrp[NMAX], trgcnt[NMAX], ans[NMAX] = {0};
  scanf("%d %d %d", &n, &k, &l);
  for (i = 0; i < n; i++) {
    droot[i] = troot[i] = i;
    dleaf[i] = dnext[i] = -1;
    trgrp[i] = trgcnt[i] = 0;
  }
  for (i = 0; i < k; i++) {
    int p, q, proot, qroot;
    scanf("%d %d", &p, &q);
    proot = UF_find(p - 1, droot);
    qroot = UF_find(q - 1, droot);
    if (proot != qroot) {
      if (proot < qroot) droot[qroot] = proot;
      else droot[proot] = qroot;
    }
  }
  for (i = 0; i < l; i++) {
    int r, s, rroot, sroot;
    scanf("%d %d", &r, &s);
    rroot = UF_find(r - 1, troot);
    sroot = UF_find(s - 1, troot);
    if (rroot != sroot) {
      if (rroot < sroot) troot[sroot] = rroot;
      else troot[rroot] = sroot;
    }
  }
  for (i = 0; i < n; i++) {
    int rd = UF_find(i, droot);
    if (i == rd) dleaf[i] = i;
    else {
      dnext[i] = dleaf[rd];
      dleaf[rd] = i;
    }
  }
  for (i = 0; i < n; i++) {
    if (dleaf[i] >= 0) {
      rdgrp++;
      for (j = dleaf[i]; j >= 0; j = dnext[j]) {
        int rt = UF_find(j, troot);
        if (trgrp[rt] == rdgrp) trgcnt[rt]++;
        else {
          trgrp[rt] = rdgrp;
          trgcnt[rt] = 1;
        }
      }
      for (j = dleaf[i]; j >= 0; j = dnext[j]) {
        int rt = UF_find(j, troot);
        ans[j] = trgcnt[rt];
      }
    }
  }
  for (i = 0; i < n; i++) printf("%d%c", ans[i], i == n - 1 ? '\n': ' ');
}

int UF_find(int a, int *ufp)
{
  if (ufp[a] == a) return a;
  else {
    ufp[a] = UF_find(ufp[a], ufp);
    return ufp[a];
  }
}
