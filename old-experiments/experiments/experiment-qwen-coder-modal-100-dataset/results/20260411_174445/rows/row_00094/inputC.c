#include<stdio.h>

int main(){

	int i,j,n,a[10],b,c,nflag;

	scanf("%d",&n);

	for(i=0;i<n;i++){
		nflag=0;
		for(j=0;j<9;j++) scanf("%d ",&a[j]);
		scanf("%d",&a[9]);

		b=a[0];
		c=0;
		for(j=1;j<10;j++){
			if(b<a[j]) b=a[j];
			else if(c<a[j]) c=a[j];
			else{
				printf("NO\n");
				nflag=1;
				break;
			}
		}
		if(nflag) continue;
		printf("YES\n");

	}



	return 0;

}