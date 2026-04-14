#include<stdio.h>
int n;
int G[101][101];
int A[101];
int flag[101];
void mst(int s){
  int i;
  int nx=-1,ct=10000000;
  int a = 0;
  for(i=0;i<n;i++){
    if(G[s][i]==-1) continue;
    else if(G[s][i] < A[i] && flag[i]==0) A[i] = G[s][i];
  }
  
  for(i=1;i<n;i++){
    if(flag[i]==1) continue;
    else{
      if(ct > A[i]){
	a = 1;
	ct = A[i];
	nx = i;
      }
    }
  }
  
  if(a){
    flag[nx] = 1;
    mst(nx);
  }
  
}
int main(){
  
  int i,j;
  
  scanf("%d",&n);
  for(i=1;i<n;i++) A[i] = 100000000;
  for(i=0;i<n;i++)
    for(j=0;j<n;j++) scanf("%d",&G[i][j]);
  flag[0]=1;
  mst(0);
  int ans=0;
  for(i=0;i<n;i++){
    //printf("%d\n",A[i]);
    ans+=A[i];
  }
  printf("%d\n",ans);
  /*
  for(i=0;i<n;i++){
    for(j=0;j<n;j++){
      if(G[i][j]==-1) printf(" 0");
      else printf("%2d",G[i][j]);
    }
    printf("\n");
  }
  */
  return 0;
}

