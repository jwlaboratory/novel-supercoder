#include <stdio.h>

int main(void)
{
  int n , k ,ans = 1;
  
  scanf("%d %d",&n,&k);
  
  for(int i = 0; i < n;i ++){
    if(ans*2<k+ans){
      int c = ans;
      ans = 2*c;
    }
    else{
      ans += k;
    }
  }

  printf("%d",ans);
  
  return 0;
}