```c
#include<stdio.h>
int main()
{
	int a[100005];
	int n;
	scanf("%d",&n);
	long long sum=0;
	int b[100005]={0};
	for(int i=0;i<n;i++){
		scanf("%d",&a[i]);
		b[a[i]]++;
	}
	for(int i=0;i<n;i++){
		int t=a[i];
		a[i]++;
		b[a[i]]++;
		t--;
		b[t]++;
	}
	int max=0;
	for(int i=0;i<100005;i++){
		if(max<b[i])
			max=b[i];	
	}
	printf("%d\n",max);
}```