```c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int compare_int(const void *a, const void *b)
{
    return *(int*)b - *(int*)a;
}

int main(void){
  int n, k; 
  long int sum=0;
  scanf("%d", &n);
  scanf("%d", &k);
  int s[n];
  for(int i=0; i<n; i++){
    scanf("%d", &s[i]);
  }
  if(n <= k){
    printf("0");
  }else{
    qsort(s, n, sizeof(int), compare_int);
    for(int m=k;m<n;m++){
      sum += s[m];
    }    
    printf("%ld", sum);
  }
  return 0;
}```