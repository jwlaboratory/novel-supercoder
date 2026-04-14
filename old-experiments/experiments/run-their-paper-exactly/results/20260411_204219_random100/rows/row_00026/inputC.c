```c
#include <stdio.h>
int a[6];
int main(){
	int n;
	scanf("%d",&n);
	for(int i=0;i<n;i++){
		int k;
		scanf("%d",&k);
		int d[3]={0,1,2};
		while(k--){
			int x;
			scanf("%d",&x);
			if(x){int t=d[1];d[1]=d[2];d[2]=t;}
			else{int t=d[1];d[1]=d[0];d[0]=t;}
		}
		a[d[0]*2+(d[1]>d[2])]++;
	}
	if(a[0]>=1||a[1]>=2||a[2]>=2||a[5]>=2||a[3]>=3||a[4]>=3||(a[3]&&a[4])||(a[1]+a[2]+a[5]>=2&&(a[3]||a[4])))puts("yes");
	else puts("no");
}
```