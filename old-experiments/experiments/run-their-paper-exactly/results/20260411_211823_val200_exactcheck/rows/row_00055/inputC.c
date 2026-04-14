```c
#include<stdio.h>
int N,W,v[105],w[105],i,j,dp[10005]={0},r;

int main()
{
	scanf("%d%d",&N,&W);
	for(i=0;i<N;i++)
		scanf("%d%d",&v[i],&w[i]);
	for(i=0;i<N;i++)
		for(j=0;j<=W;j++)
			if(j-w[i]>=0)
			{
				dp[j]=dp[j]<dp[j-w[i]]+v[i]?dp[j-w[i]]+v[i]:dp[j];
				r=r<dp[j]?dp[j]:r;
			}
	printf("%d\n",r);
	return 0;
}```