#include <stdio.h>

int gcd(int x, int y) {
	if (x % y == 0) return y;

    return gcd(y, x % y);
}

int main( ) {
	int x, y, ans, buff, max, i;

	scanf("%d %d", &x, &y);

	if (x < y) {
		buff = x;
		x = y;
		y = buff;
	}

	printf("%d\n", gcd(x, y));

	return 0;
}