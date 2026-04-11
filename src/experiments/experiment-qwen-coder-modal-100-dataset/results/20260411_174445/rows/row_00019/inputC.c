int N,M,X[1<<17];
int cnt[1<<17],mcnt[1<<17],p[1<<17];
main()
{
	scanf("%d%d",&N,&M);
	for(int i=0;i<N;i++)
	{
		scanf("%d",X+i);
		cnt[X[i]]++;
	}
	int ans=0;
	for(int i=1;i<1<<17;i++)
	{
		ans+=cnt[i]/2;
		mcnt[i%M]+=cnt[i]%2;
		p[i%M]+=cnt[i]/2;
	}
	for(int i=0;i<=M/2;i++)
	{
		if(i==(M-i)%M)
		{
			ans+=mcnt[i]/2;
			continue;
		}
		int t=fmin(mcnt[i],mcnt[M-i]);
		ans+=t;
		mcnt[i]-=t;
		mcnt[M-i]-=t;
		ans+=fmin(p[M-i],mcnt[i]/2);
		ans+=fmin(p[i],mcnt[M-i]/2);
	}
	printf("%d\n",ans);
}