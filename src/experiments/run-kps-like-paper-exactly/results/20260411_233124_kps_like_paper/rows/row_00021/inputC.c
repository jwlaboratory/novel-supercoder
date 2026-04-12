#include <stdio.h>

int main(void) {
	int p[16384] = {0};
	int i,j,n;
	for(i = 2;i <= 16000;i++){
		if(p[i]){continue;}
		for(j = 2*i;j <= 16000;j+=i){
			p[j] = 1;
		}
	}
	while(scanf("%d",&n) , n != 0){
		for(i = n;i >= 5;i--){
			if(!(p[i]) && !(p[i-2])){printf("%d %d\n",i-2,i);break;}
		}
	}
	return 0;
}