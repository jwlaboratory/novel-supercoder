```c
#include <stdio.h>          // printf(), scanf(), getchar()
#include <ctype.h>          // isdigit()
#include <stdbool.h>

#define MAX_N 100000
#define min(a, b) ((a) < (b) ? (a) : (b))

int a[MAX_N];
int S;
int n;

int
solve()
{
	int s, t;

	int res = n + 1;
	int sum = 0;
	s = 0, t = 0;
	while (true)
	{
		while (t < n && sum < S)
			sum += a[t++];

		if (sum < S)
			break;

		res = min(res, t - s);
		sum -= a[s++];
	}

	if (res > n)
		return 0;

	return res;
}

int
main(int argc, char** argv)
{
	int d;
	int c;
	int i;

	scanf("%d %d", &n, &S);
	c = getchar();
	for (i = 0; i < n; ++i)
	{
		while (c == ' ' || c == '\n')
			c = getchar();

		d = 0;
		while (isdigit(c))
		{
			d = d * 10 + c - '0';
			c = getchar();
		}

		a[i] = d;
	}

	printf("%d\n", solve());
	return 0;
}```