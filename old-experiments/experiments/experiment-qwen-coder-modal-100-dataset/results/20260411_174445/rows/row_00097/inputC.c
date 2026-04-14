// AOJ 2603 TiMe Table
// 2018.3.19 bal4u

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// [library]
//#define getchar_unlocked()  getchar()
int in()	// get non-negative integer from stdin
{
	int n = 0, c = getchar_unlocked();
	do n = 10*n + (c & 0xf), c = getchar_unlocked(); while (c >= '0');
	return n;
}
// [\library]  

int t[2002], x[2002];
int w[2002][2002];
int dp[2002][2002];
int minima[2002];

int cmp(int *a, int *b) { return *a - *b; }

void cminima(int d,int ia,int ib,int ja,int jb)
{
	int j, id, mn, tmp, im;

	if (ia > ib) return;
	if (ia == ib) {
		mn = 0, id = -1;
		for (j = ja; j <= jb; j++) {
			tmp = dp[j][d] + w[j+1][ia];
			if (id < 0 || mn > tmp) id = j, mn = tmp;
		}
		minima[ia] = id;
		return;
	}
	im = (ia + ib)/2;
	cminima(d, im, im, ja, jb);
	cminima(d, ia, im-1, ja, minima[im]);
	cminima(d, im+1, ib, minima[im], jb);
}

int main()
{
	int S, N, M, tm, p, i, d, k, ans;
	int lo, hi;

	S = in(), N = in(), M = in();
	if (M >= N) { puts("0"); return 0; }
	for (i = 1; i <= S; i++) x[i] = in();
	for (i = 0; i < N; i++) {
		tm = in(), p = in();
		t[i] = tm - x[p];
	}
	qsort(t, N, sizeof(int), cmp);
	if (M == 1) {
		tm = t[N-1], ans = 0;
		for (i = 0; i < N; i++) ans += tm - t[i];
		printf("%d\n", ans);
		return 0;
	}

	memset(dp, 0x30, sizeof(dp));
	for (hi = 0; hi < N; hi++) {
		for (lo = hi-1; lo >= 0; lo--) w[lo][hi] = w[lo+1][hi] + t[hi]-t[lo];
	}
	for (i = 0; i < N; i++) dp[i][0] = w[0][i];
	M--; for (d = 1; d <= M; d++) {
		cminima(d-1, 0, N-1, 0, N-1);
		for (i = 0; i < N; i++) k = minima[i], dp[i][d] = dp[k][d-1]+w[k+1][i];
	}
	printf("%d\n", dp[N-1][M]);
	return 0;
}
