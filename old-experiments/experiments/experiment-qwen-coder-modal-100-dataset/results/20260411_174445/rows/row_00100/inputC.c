// AOJ 0372: Three Meals
// 2017.11.14 bal4u@uu
// 2017.11.16

#include <stdio.h>
#include <stdlib.h>

typedef struct { long long b; int n, t; } T;
T tbl[3][1440]; int sz[3];
long long a[3][1440];

int bitcount64(long long x)
{
	x = ((x & 0xAAAAAAAAAAAAAALL) >>  1) + (x & 0x55555555555555LL);
	x = ((x & 0xCCCCCCCCCCCCCCLL) >>  2) + (x & 0x33333333333333LL);
	x = ((x & 0xF0F0F0F0F0F0F0LL) >>  4) + (x & 0x0F0F0F0F0F0F0FLL);
	x = ((x & 0x00FF00FF00FF00LL) >>  8) + (x & 0xFF00FF00FF00FFLL);
	x = ((x & 0xFF0000FFFF0000LL) >> 16) + (x & 0x00FFFF0000FFFFLL);
	x = ((x & 0xFFFFFF00000000LL) >> 32) + (x & 0x000000FFFFFFFFLL);
	return (int)x;
}

int cmp(T *a, T *b) { if (b->n - a->n) return b->n - a->n; return b->t - a->t; }

int main()
{
	int n, i, j, f, ans;
	long long b, bb;
	T *ap, *hp, *bp;
	
	scanf("%d", &n);
	for (b = 1, i = 0; i < n; i++, b <<= 1) for (j = 0; j < 3; j++) {
		int sh, sm, eh, em, t;
		scanf("%d%d%d%d", &sh, &sm, &eh, &em);
		sh = sh*60+sm, eh = eh*60+em;
		for (t = sh; t <= eh; t++) a[j][t] |= b;
	}
	for (j = 0; j < 3; j++) {
		T *tp;
		for (tp = tbl[j], i = 0; i < 1440; i++) if ((b = a[j][i]) > 0) {
			tp->b = b, tp->n = bitcount64(b), tp->t = i, tp++;
		}
		sz[j] = tp - tbl[j];
		qsort(tbl[j], sz[j], sizeof(T), cmp);
	}
//	tbl[1][sz[1]].n = tbl[2][sz[2]].n = 0; 

	ans = 0;
	b  = tbl[0][0].b, n = tbl[0][0].n;
	b &= tbl[1][0].b; if (tbl[1][0].n < n) n = tbl[1][0].n;
	b &= tbl[2][0].b; if (tbl[2][0].n < n) n = tbl[2][0].n;
	if (bitcount64(b) == n &&
		tbl[0][0].t < tbl[1][0].t && tbl[1][0].t < tbl[2][0].t) {
		ans = n; goto done;
	}

	for (ap = tbl[0]; ap->n > ans; ap++) for (hp = tbl[1]; hp->n > ans; hp++) {
		if (hp->t <= ap->t) continue;
		bb = ap->b & hp->b;
		if (bitcount64(bb) <= ans) continue;
		for (bp = tbl[2]; bp->n > ans; bp++) {
			if (bp->t <= hp->t) continue;
			if ((f = bitcount64(bb & bp->b)) > ans) {
				ans = f; if (ans == ap->n) goto done;
			}
		}
	}
done:
	printf("%d\n", ans);
	return 0;
}