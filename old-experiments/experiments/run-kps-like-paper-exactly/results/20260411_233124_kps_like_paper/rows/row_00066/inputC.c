// AOJ 0625: Oranges
// 2017.12.16 bal4u@uu

#include <stdio.h>
#include <string.h>

#define INF 0x3030303030303030LL
int N, M, K;
int a[20001];
long long memo[20001];
char buf[30], *p;

int in()
{
	int n = 0;
	while (*p >= '0') n = (n<<3) + (n<<1) + (*p++ & 0xf);
	return n;
}

long long rec(int k)
{
	int i, lim;
	long long min, max, t, ans;

	if (k >= N) return 0;
	if (memo[k] < INF) return memo[k];
	ans = INF;
	min = max = a[k];
	lim = k + M; if (lim > N) lim = N;
	for (i = k; i < lim; i++) {
		if      (max < a[i]) max = a[i];
		else if (min > a[i]) min = a[i];
		t = rec(i+1) + K + (i-k+1) * (max-min);
		if (t < ans) ans = t;
	}
	return memo[k] = ans;
}

int main()
{
	int i;

	fgets(p=buf, 30, stdin);
	N = in(), p++, M = in(), p++, K = in();
	for (i = 0; i < N; i++) {
		fgets(p=buf, 15, stdin);
		a[i] = in();
	}
	memset(memo, 0x30, sizeof(memo));
	printf("%lld\n", rec(0));
	return 0;
}