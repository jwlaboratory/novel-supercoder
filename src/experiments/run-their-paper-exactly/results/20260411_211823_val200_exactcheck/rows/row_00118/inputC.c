```c
int main(){
int n,m;
	for(;scanf("%d%d",&n,&m),n;){
		int t=1001,pre,ans,cnt=0,i;
		for(i=0;i<n;i++){
			int a; scanf("%d",&a);

			int j;
			for(j=m;j%a;j--);

			if(j<t || (j==t && a<=pre)){
				cnt=(j==t&&a==pre?cnt+1:1);
				t=j;
				pre=a;
				ans=i;
			}
		}

		printf("%d\n",cnt<2?ans+1:n);
	}

	return 0;
}```