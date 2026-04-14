#include <stdio.h>

int main(void) {
	int N, M, i, a, b;
	int count[100001] = {0};
	scanf("%d%d", &N, &M);
	for (i = 0; i < M; i++) {
		scanf("%d%d", &a, &b);
		count[a]++;
		count[b]++;
	}

	for (i = 1; i <= N; i++) {
		if (count[i] % 2 != 0) {
			printf("NO\n");
			return 0;
		}
	}

	printf("YES\n");
	return 0;
}