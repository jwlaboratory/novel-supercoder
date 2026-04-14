```c
#include <stdio.h>

int main()
{
	int i, j, p, N;
	scanf("%d", &N);
	printf("%d\n", (N - 1) * (N - 1) / 2);
	for (i = 1, p = 1 - N % 2; i < N; i++) {
		for (j = i + 1; j <= N; j++) if (j != N - i + p) printf("%d %d\n", i, j);
	}
	fflush(stdout);
	return 0;
}```