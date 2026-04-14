```c
#include <stdio.h>

int main () {
	int n, k, x ,y, sum = 0;
	scanf("%d", &n);
	scanf("%d", &k);
	scanf("%d", &x);
	scanf("%d", &y);
	
	for (int i = 1; i <= n; i++) {
		if ( i <= k ) {
			sum += x;
		}
		else if ( i > k) {
			sum += y;
		}
	}
	printf("%d", sum);
	return 0;
}```