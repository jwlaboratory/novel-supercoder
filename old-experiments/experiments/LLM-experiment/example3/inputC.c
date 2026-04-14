#include <stdio.h>

//#define getchar_unlocked()  getchar()
int in()
{
	int n = 0, c = getchar_unlocked();
	do n = 10*n + (c & 0xf), c = getchar_unlocked(); while (c >= '0');
	return n;
}

#define MAX_N 102

int a[MAX_N];

void dump(int n)
{
	int i;

	printf("%d", a[0]);
	for (i = 1; i < n; i++) printf(" %d", a[i]);
	putchar('\n');
}

void insertion_sort(int n)
{
	int i, j, key;

	dump(n);
	for (i = 1; i < n; i++) {
		key = a[i];
		j = i-1;
		while (j >= 0 && a[j] > key) a[j+1] = a[j], j--;
		a[j+1] = key;
		dump(n);
	}
}

int main()
{
	int N, i;

	N = in();
	for (i = 0; i < N; i++) a[i] = in();
	insertion_sort(N);
	return 0;
}
