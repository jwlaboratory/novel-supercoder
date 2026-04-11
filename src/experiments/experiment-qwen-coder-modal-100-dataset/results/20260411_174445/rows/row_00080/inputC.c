// Aizu Vol-1 0193: Convenience Store
// 2017.8.25 bal4u@uu

#include <stdio.h>
#include <string.h>

typedef struct { int r, c, f; } T;
T shop[25]; int n, S, N;
int R, C;

int hexDistance(int r1, int c1, int r2, int c2)
{
#define abs(a) ((a)>=0?(a):(-(a)))
	int dr, dc, c;
	dr = abs(r2 - r1), dc = abs(c2 - c1);
	if (r2 == r1) return dc;
	if (c2 == c1) return dr;
	if (r2 < r1) c = r2, r2 = r1, r1 = c, c = c2, c2 = c1, c1 = c;
	if (c2 >= c1) {
		c = c1 + (dr+1-(r1&1))/2;
		if (c2 >= c) dr += abs(c-c2);
	} else {
		c = c1 - (dr+(r1&1))/2;
		if (c2 <= c) dr += abs(c-c2);
	}
	return dr;
}

int main()
{
	int i, k, r, c;
	int d[25];

	while (scanf("%d%d", &C, &R) && C) {
		scanf("%d", &S); for (n = 0, i = 0; i < S; i++)
			scanf("%d%d", &shop[n].c, &shop[n].r), shop[n++].f = 0;
		scanf("%d", &N); for (i = 0; i < N; i++)
			scanf("%d%d", &shop[n].c, &shop[n].r), shop[n++].f = 0;
		for (r = 1; r <= R; r++) for (c = 1; c <= C; c++) {
			for (i = 0; i < n; i++) d[i] = hexDistance(shop[i].r, shop[i].c, r, c);
			for (k = -1, i = 0; i < S; i++) if (k < 0 || d[i] < k) k = d[i];
			for (i = S; i < n; i++) if (d[i] < k) shop[i].f++;
		}	
		for (k = -1, i = S; i < n; i++) if (shop[i].f > k) k = shop[i].f;
		printf("%d\n", k);
	}
	return 0;
}