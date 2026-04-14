#include<stdio.h>
#define INF 1000000000

int matrixChainOrder(int *,int);
int min(int,int);
int p[101];
int m[101][101];
int main(){
  int n,i,cos,b;
  scanf("%d",&n);
  for(i=1;i<=n;i++){
    scanf("%d %d",&p[i-1],&p[i]);
  }
  cos=matrixChainOrder(p,n);
  printf("%d\n",cos);
  return 0;
}
int matrixChainOrder(int *p,int n){
  int i,j,l,k,q;
  for(i=1;i<=n;i++)m[i][i]=0;
  for(l=2;l<=n;l++){
    for(i=1;i<=n-l+1;i++){

      j=i+l-1;
      m[i][j]=INF;
      for(k=i;k<=j-1;k++){
	m[i][j]=min(m[i][j],m[i][k]+m[k+1][j]+p[i-1]*p[k]*p[j]);
      }
    }
  }
  return m[1][j];
}
int min(int m,int q){
  if(m>=q){
    return q;
  }
  else if(m<=q)return m;
}