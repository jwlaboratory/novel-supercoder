```c
#include <stdio.h>

int main(void){
  long long int n = 0, a = 0, b = 0;
  long long int ans = 0;
  
  scanf("%lld %lld %lld",&n,&a,&b);
  
  if(a>b){
  	ans = a;
    a = b;
    b = ans;
  }
  
  if((b-a) % 2 == 0){
    ans = (b-a) / 2;
  }else if((a+b-1)<=n){
    ans = (a+b-1)/2;
  }else{
    ans = (n-a+n-b+1)/2;
  }
  
  printf("%lld\n",ans);
  return 0;
}```