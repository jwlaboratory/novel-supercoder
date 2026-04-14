```c
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int f(long h[2], const int a[2], const int b[2]){
	if(a[0]*b[1]>a[1]*b[0]){
		long r = (h[1]+a[1]-1)/a[1];
		h[0] = r*a[0];
		h[1] = r*a[1];
	}else{
		long r = (h[0]+a[0]-1)/a[0];
		h[0] = r*a[0];
		h[1] = r*a[1];
	}
}

int main(void){
	int n, i;
	long h[2]={1,1};
	int a[2], b[2]={1,1};
	scanf("%d", &n);
	for(i=0; i<n; i++){
		scanf("%d%d", a, a+1);
		f(h, a, b);
		b[0]=a[0], b[1]=a[1];
	}
	printf("%ld\n", h[0]+h[1]);
}
```