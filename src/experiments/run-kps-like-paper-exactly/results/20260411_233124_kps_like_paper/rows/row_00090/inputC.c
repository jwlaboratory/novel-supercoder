#include<stdio.h>
#define N 100
#define INF (1<<21)
#define MAXSIZE 100
int n,A[N][N];
int dis[N];
int Q[MAXSIZE];
int head = 0;
int tail = 1;

void enqueue(int x)
{
  Q[tail++] = x;
}

int deq() {
  int s;
  s = Q[head++];
  return s;

}
int empty()
{
  return (head == tail);
}
void bfs(int t)
{
  int i,j;
  enqueue(t);
  for(i=0;i<n;i++)dis[i]=INF;
  dis[t]=0;
  int a;
  while(!empty())
    {
      a=deq();
      for(j=0;j<n;j++)
        {
          if(A[a][j]==0)continue;
          if(dis[j]!=INF)continue;
          dis[j]=dis[a]+1;
          enqueue(j);
        }
    }
  for(i=0;i<n;i++)
    {
      printf("%d %d\n",i+1,((dis[i]==INF)?(-1):dis[i]));
    }
}
int main()
{
  int i,j,p,k,pnum;

  scanf("%d",&n);
  for(i=0;i<n;i++)
    {
      for(j=0;j<n;j++)
        {
          A[i][j]=0;
        }
    }
  for(i=0;i<n;i++)
    {
      scanf("%d %d",&p,&k);
      p--;
      for(j=0;j<k;j++)
        {
          scanf("%d",&pnum);
          pnum--;
          A[p][pnum]=1;
        }
    }
  bfs(0);
  return 0;
}