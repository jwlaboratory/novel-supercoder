#include <stdio.h>
int main(){
	int i;
	char cards[201];
	int n;
	int k;
	int turn;
	int rem[2];
	
	while(1){
		scanf("%d\n",&n);
		if(!n)break;
		for(i=0;i<=200;i++){
			cards[i]=9;
		}
		for(i=1;i<=2*n;i++){
			cards[i]=1;
		}
		for(i=1;i<=n;i++){
			scanf("%d\n",&k);
			cards[k]=0;
		}
		//start
		turn=0;
		rem[0]=n;
		rem[1]=n;
		
//int l;for(l=1;l<=2*n;l++){printf(l==2*n?"%d\t":"%d ",cards[l]);}printf("%d %d\n",rem[1],rem[0]);
		
		while(rem[0]>0&&rem[1]>0){
			for(i=1;i<=2*n;i++){
				if(cards[i]==turn){
					cards[i]=7+turn;
					rem[turn]--;
					if(!rem[0]||!rem[1])break;
//for(l=1;l<=2*n;l++){printf(l==2*n?"%d\t":"%d ",cards[l]);}printf("%d %d\n",rem[1],rem[0]);
					turn=1-turn;
				}
			}
			turn=1-turn;
		}
		printf("%d\n%d\n",rem[1],rem[0]);
	}
	return 0;
}