// AOJ 2446: Enumeration
// 2017.11.26 bal4u@uu

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

long long a[22];
int p[22];

long long gcd(long long a, long long b)
{
	long long r;
	while (b != 0) r = a % b, a = b, b = r;
	return a;
}

int main()
{
	int n, i, j, f, lim;
	long long m, t;
	double ans, pp;

	scanf("%d%lld", &n, &m);
	for (i = 0; i < n; i++) scanf("%lld", a+i);
	for (i = 0; i < n; i++) scanf("%d", p+i);
	
	ans = 0;
	for (lim = 1 << n, i = 1; i < lim; i++) {
		f = 0, pp = 1;
		for (t = 1, j = 0; j < n; j++) if ((i >> j) & 1) {
			f++, pp *= p[j] / 100.0;
			t /= gcd(t, a[j]);
			if (t > (1LL<<62)/a[j]) { t = -1; break; }
			t *= a[j];
		}
		if (t > 0) {
			if (f & 1) ans += pp * (m / t);
			else       ans -= pp * (m / t);
		}
	}
	printf("%.10lf\n", ans);
	return 0;
}