#include <stdio.h>
int main(void) {
	long long n, i, a, b, ans[100001] = {};
	long long k, count = 0;
	scanf("%lld%lld", &n, &k);
	for (i = 0; i < n; i++) {
		scanf("%lld%lld", &a, &b);
		ans[a] += b;
	}

	for (i = 1 ; i <= 100000; i++) {
		count += ans[i];
		if (k <= count) break;
	}
	printf("%lld\n", i);
	return 0;
}