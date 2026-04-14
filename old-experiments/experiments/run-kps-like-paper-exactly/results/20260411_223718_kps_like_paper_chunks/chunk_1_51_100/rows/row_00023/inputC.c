#include<stdio.h>

int main(){
	int i=0, j=0;
	for(i=1;i<=9;i++){
		for(j=1;j<=9;j++){
			printf("%ix%i=%i\n",i,j,(i*j));
		}
	}
    return 0;
}