#include<stdio.h>

#define mod 1000000007
#define ll long long

int r1,c1,r2,c2;
int st,la;
ll ans=0;

ll pow2(ll a,ll n){
  /*
  if(n==1) return a;
  if(n%2==0){
    return pow2(a*a%mod,n/2)%mod;}
  else{
    return a*pow2(a-1,n)%mod;}
  */
  ll x=1;
  for(a%=mod;n;n/=2) n&1 ? x=x*a%mod:0,a=a*a%mod;
  return x;
}

ll com(int n,int k){
  ll ans=1;
  for(int i=0;i<k;i++){
    ans = ans*(n-i)%mod*pow2(k-i,mod-2)%mod;}
  return ans;}

ll g(int r,int c){
  return com(r+1+c+1,r+1);
}

int main(){
  scanf("%d %d %d %d",&r1,&c1,&r2,&c2);

  ll ans = g(r2,c2)-g(r2,c1-1)-g(r1-1,c2)+g(r1-1,c1-1);
  ans = (ans+mod)%mod;
  printf("%lld\n",ans);
}
