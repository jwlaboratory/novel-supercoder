```c
#include<stdio.h>
#include<stdlib.h>
int N,T,D[100000],i,j,t;
long long R=1;
int M=1000000007;
int cmp(const void*a,const void*b){return *(int*)a-*(int*)b;}

int main()
{
	scanf("%d%d",&N,&T);
	for(i=0;i<N;i++)
	{
		scanf("%d",&D[i]);
	}
	qsort(D,N,4,cmp);
	for(i=t=0;i<N;i++)
	{
		for(;t<N&&D[i]+T>=D[t];t++);
		R=R*(t-i)%M;
	}
	printf("%lld\n",R);
	return 0;
}```