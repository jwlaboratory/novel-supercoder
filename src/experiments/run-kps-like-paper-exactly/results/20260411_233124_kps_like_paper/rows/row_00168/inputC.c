#include<stdio.h>
#define WHITE 0
#define GRAY 1
#define BLACK 2
#define N 100

int M[N][N];
int color[N],d[N],f[N],cnt,num;
void dfs_2(int);
void dfs_1();

/*main??¢??°*/
int main(){

  int u,v,d,i,j;
  scanf("%d",&num);
  for(i=0;i<num;i++){
    for(j=0;j<num;j++){
      M[i][j]=0;}}

  for(i=0;i<num;i++){
    scanf("%d %d",&u,&d);
    u--;
    for(j=0;j<d;j++){
      scanf("%d",&v);
      v--;
      M[u][v]=1;
    }
  }
  dfs_1();
  return 0;
}
void dfs_2(int u){
  int v;
  color[u]=GRAY;

  /*????????????*/
  d[u]=++cnt;
  for(v=0;v<num;v++){
    if(M[u][v]==0)continue;
    if(color[v]==WHITE){
      dfs_2(v);
    }
  }
  color[u]=BLACK;
  /*????????????*/
  f[u]=++cnt;
}

void dfs_1(){
  int i;

  /*?????????*/
  for(i=0;i<num;i++){
    color[i]=WHITE;
  }
  cnt=0;

  for(i=0;i<num;i++){
    if(color[i]==WHITE)dfs_2(i);
  }

  /*??¨???*/
  for(i=0;i<num;i++){
    printf("%d %d %d\n",i+1,d[i],f[i]);
  }
}