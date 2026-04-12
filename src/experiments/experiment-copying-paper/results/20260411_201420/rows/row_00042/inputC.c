```c
#include<stdio.h>

int main(void){
  long long n , x;
  scanf("%lld %lld",&n ,&x);

  long long a[n];
  for(int i = 0;i < n;i ++){
    scanf("%lld",&a[i]);
  }

  long long count = 0;

  for(int i = 0;i < n-1;i ++){
    if(a[i] + a[i+1] > x){
      int b = a[i] + a[i+1] - x; 
      a[i+1] -= b;
      count += b;
      //printf("%d\n",a[i+1]);
      if(a[i+1] < 0){
        a[i+1] = 0;
      }
    }
  }

  printf("%lld\n",count);

  return 0;
}```