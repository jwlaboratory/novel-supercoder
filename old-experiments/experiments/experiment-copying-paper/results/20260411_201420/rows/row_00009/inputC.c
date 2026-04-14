```c
#include <stdio.h>
#include <math.h>
#include <time.h>
#include<stdlib.h>
#include<string.h>

int main(void) {
	long long int s, c, ans = 0;

	scanf("%lld %lld", &s, &c);

	c /= 2;

	if (s < c) {
		ans += s;
		c -= s;
		ans += c / 2;
	}
	else {
		ans += c;
	}

	printf("%lld", ans);
}```