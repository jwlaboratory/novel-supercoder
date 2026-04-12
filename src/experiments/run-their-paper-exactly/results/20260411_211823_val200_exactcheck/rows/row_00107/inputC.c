```c
#include <stdio.h>

int main()
{
	int i, j, k, N, L[101], count = 0;
	scanf("%d", &N);
	for (i = 1; i <= N; i++) scanf("%d", &(L[i]));
	for (i = 1; i <= N - 2; i++) {
		for (j = i + 1; j <= N - 1; j++) {
			if (L[i] == L[j]) continue;
			for (k = j + 1; k <= N; k++) {
				if (L[k] != L[i] && L[k] != L[j] && L[i] + L[j] > L[k] && L[i] + L[k] > L[j] && L[j] + L[k] > L[i]) count++;
			}
		}
	}
	printf("%d\n", count);
	fflush(stdout);
	return 0;
}
```