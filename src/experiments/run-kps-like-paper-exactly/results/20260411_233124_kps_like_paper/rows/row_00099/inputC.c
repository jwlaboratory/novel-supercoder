#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

int main(){

  int i,j;
  int n,t;
  int a[105];
  int cnt = 0;

  scanf("%d", &n);

  for(i = 0;i < n;i++) scanf("%d", &a[i]);

  for(i = 0;i < n - 1;i++){
    for(j = n - 1;j > i;j--){
      if(a[j] < a[j - 1]){
        t = a[j]; a[j] = a[j - 1]; a[j - 1] = t;
      }
    }
  }

  for(i = 0;i < n - 1;i++){
    if(a[i] != a[i + 1]) cnt++;
  }

  printf("%d\n", cnt + 1);

  return 0;
}
