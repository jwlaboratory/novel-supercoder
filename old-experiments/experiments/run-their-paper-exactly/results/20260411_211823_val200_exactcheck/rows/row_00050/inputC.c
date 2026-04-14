```c
#include <stdio.h>
#include <stdlib.h>

int main()
{
	int i, N, p[100001];
	scanf("%d", &N);
	for (i = 1; i <= N; i++) scanf("%d", &(p[i]));

	int sum = 0;
	for (i = 1; i <= N; i++) {
		if (p[i] != i) continue;
		else {
			sum++;
			if (i < N && p[i+1] == i + 1) i++;
		}
	}
	
	printf("%d\n", sum);
	fflush(stdout);
	return 0;
}```