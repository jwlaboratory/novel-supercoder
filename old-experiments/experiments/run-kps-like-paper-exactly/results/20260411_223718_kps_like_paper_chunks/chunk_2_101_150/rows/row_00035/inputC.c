#include  <stdio.h>
#define rep(i,l,n) for(i=l;i<n;i++)

int main(void){
	int i,j;
	rep(i,1,10){
		rep(j,1,10){
			printf("%dx%d=%d\n",i,j,i*j);
		}
	}
	return 0;
}