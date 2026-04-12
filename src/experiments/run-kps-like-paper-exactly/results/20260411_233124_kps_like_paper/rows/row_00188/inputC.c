a[1<<18];
n=1<<18;
cnt;

main(i,j) {
	memset(a,-1,sizeof a);
	a[0]=a[1]=0;
	for(i=2;i<n;i++)
		if(a[i])
			for(j=2*i;j<n;j+=i)
				a[j] = 0;

	for(;scanf("%d",&n),n;){
		cnt=0;
		for(i=n+1;i<=2*n;i++)
			if(a[i])
				cnt++;
		printf("%d\n",cnt);
	}
	exit(0);
}