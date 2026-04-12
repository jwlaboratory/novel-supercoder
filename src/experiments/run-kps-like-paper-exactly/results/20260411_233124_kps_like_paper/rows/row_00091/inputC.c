#include<stdio.h>
int main(void){
	int x[10000];
	int i=0;
	while(1){
		scanf("%d",&x[i]);
		if(x[i]==0){break;}
		i++;
	}
	int h=0;
	for(h=0;i>h;h++){
		printf("Case %d: %d\n",h+1,x[h]);
	}
	return 0;
}
