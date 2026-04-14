// AOJ 2621: Fox Observation
// 2017.11.26 bal4u@uu

#include <stdio.h>
#include <stdlib.h>

#define HASHSIZ 800011
typedef struct { long long n; int w; } HASH;
HASH hash[HASHSIZ+3], *hashend = hash+HASHSIZ;

int ans;

void insert(int x, int y, int w)
{
	long long xy = ((long long)x << 32) + y;
	HASH *p = hash + xy % HASHSIZ;
	while (p->n) {
		if (p->n == xy) goto next;
		if (++p == hashend) p = hash;
	}
	p->n = xy;
next:
	p->w += w;
	if (p->w > ans) ans = p->w;
}

#define BASE 1000000000		// 10^9

char buf[35], *p;
int getint(void)
{
	int n = 0;
	if (*p == '-') {
		p++; while (*p >= '0') n = (n<<3) + (n<<1) + (*p++ & 0xf);
		return -n;
	}
	while (*p >= '0') n = (n<<3) + (n<<1) + (*p++ & 0xf);
	return n;
}

int main()
{
	int n, i, x, y, w;

	fgets(p=buf, 10, stdin), n = getint();
	ans = 0;
	for (i = 0; i < n; i++) {
		fgets(p=buf, 35, stdin);
		x = BASE + getint(), p++, y = BASE + getint(), p++, w = getint();
		insert(x  , y  , w);
		insert(x+1, y  , w);
		insert(x  , y+1, w);
		insert(x+1, y+1, w);
	}
	printf("%d / 1\n", ans);
	return 0;
}