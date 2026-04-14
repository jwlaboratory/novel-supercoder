#include <stdio.h>
#include <stdlib.h>
int main(){
	int N;
	int min,tmp;
	scanf("%d",&N);
	int *L;
	L = (int *)malloc(sizeof(int)*N);
	for(int i=0;i<N;i++){
		scanf("%d",&L[i]);
	}

	for(int i=0;i<N;i++){
		for(int j=i;j<N;j++){
			if(L[i]<L[j]){
				min = L[i];
				L[i]=L[j];
				L[j] = min;
			}
		}
	}

	for(int i=1;i<N;i++){
		tmp += L[i];
	}

	if(L[0]<tmp){
		printf("Yes\n");
	}else{
		printf("No\n");
	}
	return 0;
}