#include<stdio.h>
#include<stdlib.h>
int compare_long(const void *a, const void *b){if(*(long*)a - *(long*)b > 0){return -1;}else if(*(long*)a - *(long*)b < 0){return 1;}else{return 0;}}
int min(int a, int b){return a>b?b:a;}

int x, y, z, w, k, i, j;
long a[1000], b[1000], c[1000], d[1000000], e[3000000];

int main(void){
  scanf("%d%d%d%d", &x, &y, &z, &k);
  for(i=0; i<x; i++){
    scanf("%ld", a+i);
  }
  for(i=0; i<y; i++){
    scanf("%ld", b+i);
  }
  for(i=0; i<z; i++){
    scanf("%ld", c+i);
  }
  for(i=0; i<x; i++){
    for(j=0; j<y; j++){
      d[i*y+j] = a[i]+b[j];
    }
  }
  qsort(d, x*y, sizeof(long), compare_long);
  w=min(x*y, k);
  for(i=0; i<w; i++){
    for(j=0; j<z; j++){
      e[i*z+j] = d[i]+c[j];
    }
  }
  qsort(e, w*z, sizeof(long), compare_long);
  for(i=0; i<k; i++){
    printf("%ld\n", e[i]);
  }
}
