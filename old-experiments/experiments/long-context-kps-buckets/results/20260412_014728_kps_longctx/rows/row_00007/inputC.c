#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>
#define LL long long
#define INF 1<<31-1
#define MIN(x,y) ((x)<(y)?(x):(y))
#define MAX(x,y) ((x)<(y)?(y):(x))
#define FOR(i,a,n) for(i=a;i<n;i++)
#define MOD 1000000007
#define NUM 100001

void swap(int* a,int* b){int tmp=*a;*a=*b;*b=tmp;}
int GCD(int a,int b){int c=1,tmp=MAX(a,b);b=MIN(a,b);a=tmp;while(c!=0){c=a%b;a=b;b=c;}return a;}
int LCM(int a,int b){return a*b/GCD(a,b);}
int POW(LL a,LL n){LL ans=1;while(n>0){if(n&1)ans=ans*a%MOD;a=a*a%MOD;n>>=1;}return (int)ans;}
int icmp(const void* a,const void* b){return *(int*)a-*(int*)b;}
int ccmp(const void* a,const void* b){return *(char*)a-*(char*)b;}
int scmp(const void* a,const void* b){return strcmp(*(char**)a,*(char**)b);}
LL fac[NUM],finv[NUM],inv[NUM];
void comi(){int i;fac[0]=fac[1]=1;finv[0]=finv[1]=1;inv[1]=1;FOR(i,2,NUM){fac[i]=fac[i-1]*i%MOD;inv[i]=MOD-inv[MOD%i]*(MOD/i)%MOD;finv[i]=finv[i-1]*inv[i]%MOD;}}
int com(int n,int k){if(n<k||n<0||k<0)return 0;return fac[n]*(finv[k]*finv[n-k]%MOD)%MOD;}

typedef struct{int s,e,c;}Edge;
int par[NUM];
int UF(){for(int i=0;i<NUM;i++)par[i]=-1;}
int Root(int x){if(par[x]<0)return x;else return par[x]=Root(par[x]);}
int Size(int x){return -par[Root(x)];}
bool Same(int x,int y){return Root(x)==Root(y);}
void Unite(int x,int y){x=Root(x);y=Root(y);if(x!=y){if(Size(x)<Size(y))swap(&x,&y);par[x]+=par[y];par[y]=x;}}
int cmpc(const void* a,const void* b){return ((Edge*)a)->c-((Edge*)b)->c;}
int Kruscal(Edge* edge,int n){int i,ans=0;Edge e;qsort(edge,n,sizeof(Edge),cmpc);UF();FOR(i,0,n){e=edge[i];if(!Same(e.s,e.e)){Unite(e.s,e.e);ans+=e.c;}}return ans;}


int main(){
  int A,B,K,i,j,a=0,g,ans=0;
  scanf("%d%d%d",&A,&B,&K);
	g=GCD(A,B);
	FOR(i,1,g+1){
		if(g%i==0)a++;
		if(a==K){
			ans=g/i;
			break;
		}
	}

  printf("%d\n",ans);
	return 0;
}
