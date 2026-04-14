#include <stdio.h>

void solve(int n) {
	int square[n][n];
	int x, y, i;

	for (y = 0; y < n; y++) {
		for (x = 0; x < n; x++) {
			square[y][x] = 0;
		}
	}
	x = n / 2;
	y = x + 1;
	square[y][x] = 1;

	for (i = 1; i < n*n; i++) {
		x = (x+1) % n;
		y = (y+1) % n;
		if (square[y][x]) {
			x = ((x-1) > -1) ? (x-1) : (n-1);
			y = (y+1) % n;
		}
		square[y][x] = i + 1;
	}

	for (y = 0; y < n; y++) {
		for (x = 0; x < n; x++) {
			printf("%4d", square[y][x]);
		}
		putchar('\n');
	}
}

int main(void) {
	int n;

	while (1) {
		scanf("%d ", &n);
		if (!n)
			break;
		solve(n);
	}
	return 0;
}