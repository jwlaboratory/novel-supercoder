
#include<stdio.h>
int main()
{
  long long  int N,K,i,s=0,k,l,a[100000];
    scanf("%lld %lld",&N,&K);
    for(i=0;i<N;i++)
    {
      scanf("%lld",&a[i]);
    }
    for(i=0;i<N;i++)
    {
        if(a[i]>=K)
        {
            s=s+1;
        }
    }
    printf("%lld",s);
    return 0;
}
