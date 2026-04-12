```c
#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>



int main(void) {

	int n, a, b,plana,planb;
	

	scanf("%d %d %d", &n, &a, &b);

	plana = n * a;
	planb = b;

	if (plana <= planb) {
		printf("%d", plana);
	}
	else {
		printf("%d", planb);
	}

	return 0;

}
```