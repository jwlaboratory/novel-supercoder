#include<stdio.h>
#define N 9

int main(){
	int i, j;
	for(i=0;i<N;i++){
		for(j=0;j<N;j++){
			printf("%dx%d=%d\n",i+1, j+1, (i+1)*(j+1));
		}
	}
	return 0;
}