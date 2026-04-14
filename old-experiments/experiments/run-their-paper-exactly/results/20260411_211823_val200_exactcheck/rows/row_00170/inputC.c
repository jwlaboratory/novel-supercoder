```c
#include <stdio.h>

int main()
{
	int A, B, C, D;
	scanf("%d %d %d %d", &A, &B, &C, &D);
	A = (A < C)? C: A;
	B = (B < D)? B: D;
	printf("%d\n", (A < B)? B - A: 0);
	fflush(stdout);
	return 0;
}```