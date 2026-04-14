#include<stdio.h>
long long MAX(long long a,long long b){return  a<b?b:a;}
int main(){
  long long n,i,j,s,a,m,b[1010];
  while(scanf("%lld",&n),n){
    for(i=0;i<1010;i++)b[i]=0;
    for(i=s=0;i<n;i++){
      scanf("%lld",&a);
      s+=a;
    }
    for(i=0;i<n-1;i++){
      scanf("%lld",&a);
      b[a]++;
    }
    a=n;
    m=0;
    for(i=1000;i;i--){
      for(j=0;j<b[i];j++){
	m=MAX(m,s*a);
	a--;
	s+=i;
      }
    }
    printf("%lld\n",MAX(m,s));
  }
  return 0;
}

