```c
#include <stdio.h>
#include <stdlib.h>

int main()
{
	int N, K, R, S, P;
	char T[100001];
	scanf("%d %d", &N, &K);
	scanf("%d %d %d", &R, &S, &P);
	scanf("%s", T);
	
	int i, j, ans = 0;
	for (i = 0; i < K; i++) {
		if (T[i] == 'r') {
			ans += P;
			T[i] = 'P';
		} else if (T[i] == 's') {
			ans += R;
			T[i] = 'R';
		} else {
			ans += S;
			T[i] = 'S';
		}
	}
	for (; i < N; i++) {
		if (T[i] == 'r' && T[i-K] != 'P') {
			ans += P;
			T[i] = 'P';
		} else if (T[i] == 's' && T[i-K] != 'R') {
			ans += R;
			T[i] = 'R';
		} else if (T[i] == 'p' && T[i-K] != 'S') {
			ans += S;
			T[i] = 'S';
		}
	}
	
	printf("%d\n", ans);
	fflush(stdout);
	return 0;
}```