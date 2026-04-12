```c
#include <stdio.h>

int main()
{
	long long x;
	scanf("%lld", &x);
	
	long long ans = (x - 1) / 11 * 2;
	if ((x - 1) % 11 < 6) ans += 1;
	else ans += 2;
	
	printf("%lld\n", ans);
	fflush(stdout);
	return 0;
}```