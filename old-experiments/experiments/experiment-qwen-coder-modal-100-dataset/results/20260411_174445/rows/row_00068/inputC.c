#include <stdio.h>
#define min(p,q)((p)<(q)?(p):(q))

int dp[1000];
int a[4],b[4];
int main(){
	int n;
	scanf("%d",&n);
	for(int i=0;i<4;i++)scanf("%d",a+i);
	for(int i=0;i<4;i++)scanf("%d",b+i);
	for(int i=1;i<1000;i++)dp[i]=1e8;
	for(int i=0;i<900;i++){
		for(int j=0;j<4;j++){
			dp[i+b[j]]=min(dp[i+b[j]],dp[i]+a[j]);
		}
	}
	int ans=1e6;
	for(int i=n;i<1000;i++)ans=min(ans,dp[i]);
	printf("%d\n",ans);
}
