```c
#include<stdio.h>

int main(){
  long N,M,ans=0;
  scanf("%ld%ld",&N,&M);

  if (N<M)
  {
    while (N>0){ N--; M-=2; ans++;}
    if(M>3){ ans+=M/4; }
  }else{
    ans+=M/2;
  }

  printf("%ld",ans);

  return 0;
}```