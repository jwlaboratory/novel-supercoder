```c
#include<stdio.h>
#include<stdlib.h>
int lis(int size, int *A, int *L);
int main(void)
{
  int i, n, *a, *l;
  scanf("%d", &n);
  a = (int*)malloc(sizeof(int) * n);
  l = (int*)malloc(sizeof(int) * n);
  for (i = 0; i < n; i++) scanf("%d", &a[i]);
  printf("%d\n", lis(n, a, l));
  free(a);
  free(l);
}
int lis(int size, int *A, int *L)
{
  int i, length = 1;
  L[0] = A[0];
  for (i = 0; i < size; i++) {
    if (L[length-1] < A[i]) L[length++] = A[i];
    else {
      int lo = 0, hi = length - 1;
      while (lo <= hi) {
        int mid = (lo + hi) / 2;
        if (A[i] <= L[mid]) hi = mid - 1;
        else lo = mid + 1;
      }
      L[lo] = A[i];
    }
  }
  return length;
}
```