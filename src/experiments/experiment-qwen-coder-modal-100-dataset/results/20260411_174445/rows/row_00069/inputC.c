#include <stdio.h>

void quicksort(int bottom, int top, int *data) {
	int lower, upper;
	int temp;
	int div;

	if (bottom >= top)
		return;
	div = data[bottom];
	for (lower = bottom, upper = top; lower < upper; ) {
		while (lower <= upper && data[lower] <= div)
			lower++;
		while (lower <= upper && data[upper] > div)
			upper --;
		if (lower < upper) {
			temp = data[lower];
			data[lower] = data[upper];
			data[upper] = temp;
		}
	}
	temp = data[bottom];
	data[bottom] = data[upper];
	data[upper] = temp;

	quicksort(bottom, upper - 1, data);
	quicksort(upper + 1, top, data);
}

int main(void) 
{
	int n;	/* ??\???: 2 < n < 1000 */
	int a[1000] = { 0 };		/* 1 <= i <= n, 0??\???,1000000??\??? */
	int i;
	int min;
	int minus;


	while (scanf("%d", &n) == 1) {
		if (n == 0) {
			break;
		}
		else {
			for (i = 0; i < n; i++) {
				scanf("%d", &a[i]);
			}

			quicksort(0, n - 1, a);
			

			min = a[1] - a[0];
			for (i = 1; i < n - 1; i++) {
				minus = a[i + 1] - a[i];
				if (minus < min) {
					min = minus;
				}
			}
		}
		printf("%d\n", min);
		/* ????????? */
		for (i = 0; i < n; i++) {
			a[i] = 0;
		}
	}

	return 0;
}