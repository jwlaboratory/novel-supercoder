```c
#include<stdio.h>
#define M 10000
int main(){
  int n,i,j,t,r=0,P[M],s,c;
  char p[M*2]={1,1};
  for(i=2;i<M;i++){
    if(p[i])continue;
    P[r++]=i;
    for(j=i*i;j<M;j+=i)p[j]=1;
  }
  P[r]=M;
  while(scanf("%d",&n),n){
    for(t=r=c=s=0;P[t]<M;t++){
      while(s<n)s+=P[r++];
      if(s==n)c++;
      s-=P[t];
    }
    printf("%d\n",c);
  }
  return 0;
}
  ```