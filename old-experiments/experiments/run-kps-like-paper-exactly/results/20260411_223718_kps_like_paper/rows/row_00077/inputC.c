#include <stdio.h>

int main(){
	int n,m;
	for(n=1;n<=9;n++){
		for(m=1;m<=9;m++){
			printf("%dx%d=%d\n",n,m,n*m);
		}
	}
	return 0;
}