```c
#include <stdio.h>

int main() {
	
	int n, k, x=1, y=1, hasil;
	
	scanf("%d", &n);
	scanf("%d", &k);
	
	for(int i=0; i<n; i++){
		if(x*2<=x+k){
			x*=2;
		}
		else if(x*2>x+k){
			x+=k;
		}
	}
	
	printf("%d", x);
	return 0;
}```