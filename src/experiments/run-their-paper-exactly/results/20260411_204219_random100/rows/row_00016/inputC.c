```c
#include<stdio.h>
#include<stdlib.h>
#include<math.h>

typedef long long int int64;

#define MAX(a,b) ((a)>(b)?(a):(b))
#define MIN(a,b) ((a)<(b)?(a):(b))
#define ABS(a) ((a)>(0)?(a):-(a))

void run(void){
  int n;
  scanf("%d",&n);
  int a[100000];
  int i;
  for(i=0;i<n;i++) scanf("%d",a+i);
  int dp[100001];
  for(i=1;i<=n;i++) dp[i]=(1<<30);
  dp[0]=-1;
  int max=0;
  for(i=0;i<n;i++){
    int l=0;
    int r=max+1;
    while(l+1<r){
      int m=(l+r)/2;
      if(dp[m]<a[i]){
	l=m;
      } else {
	r=m;
      }
    }
    dp[r]=a[i];
    if(r>max) max=r;
  }
  printf("%d\n",max);
  return;
}

int main(void){
  run();
  return 0;
}

```