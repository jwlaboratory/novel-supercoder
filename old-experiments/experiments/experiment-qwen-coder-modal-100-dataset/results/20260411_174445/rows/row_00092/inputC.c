#include <stdio.h>

long p[100000];
long maxileft[100000];
long maxiright[100000];

int argmax(int l, int r){
  if(maxileft[r]==maxiright[l]) return maxileft[r];
  int nowmax=p[l];
  int maxindex=l;
  for(int i=l+1;i<=r;i++){
    if(p[i]>nowmax){
      maxindex=i;
      nowmax=p[i];
    }
  }
  return maxindex;
}

int ascending(int l, int r){
  for(int i=l;i<=r-1;i++){
    if(p[i]>p[i+1]) return 0;
  }
  return 1;
}

int descending(int l, int r){
  for(int i=l;i<=r-1;i++){
    if(p[i]<p[i+1]) return 0;
  }
  return 1;
}

long firstsum(int l, int r, int n){
  int i,imax;
  long ans;
  if(l==n && r==n) return 0;
  if(l!=n) imax=l;
  else imax=l+1;
  for(i=l+1;i<=r;i++){
    if(i!=n && p[i]>p[imax]){
      imax=i;
    }
  }
  if(imax<n){
    ans=p[imax]*(imax-l+1)*(r-n+1)+firstsum(imax+1,r,n);
  }else{
    ans=p[imax]*(n-l+1)*(r-imax+1)+firstsum(l,imax-1,n);
  }
  return ans;
}

long secondsum(int l, int r){
  long ans=0;
  int imax,i,j;
  int ll[100000];
  int rr[100000];

  if(r-l<1) return 0;
  if(ascending(l,r)){
    for(i=l;i<=r-1;i++){
      ans+=p[i]*(i-l+1);
    }
    return ans;
  }
  if(descending(l,r)){
    for(i=r;i>=l+1;i--){
      ans+=p[i]*(r-i+1);
    }
    return ans;
  }
  imax=argmax(l,r);
  
  if(imax==l)
    ans=secondsum(imax+1,r)+firstsum(l,r,imax);
  else if(imax==r)
    ans=secondsum(l,imax-1)+firstsum(l,r,imax);
  else
    ans=secondsum(l,imax-1)+secondsum(imax+1,r)+firstsum(l,r,imax);
  return ans;
}

int main()
{
  int i,n;
  long ans;
  scanf("%d", &n);
  for(i=0;i<n;i++){
    scanf("%d", &p[i]);
  }
  maxileft[0]=0;
  for(i=1;i<n;i++){
    if(p[i]>p[maxileft[i-1]]) maxileft[i]=i; else maxileft[i]=maxileft[i-1];
  }
  maxiright[n-1]=n-1;
  for(i=n-2;i>=0;i--){
    if(p[i]>p[maxiright[i+1]]) maxiright[i]=i; else maxiright[i]=maxiright[i+1];
  }
  ans=secondsum(0,n-1);
  printf("%ld\n",ans);  
  return 0;
}