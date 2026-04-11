// AOJ 1181: Biased Dice
// 2017.12.22 bal4u@uu

#include <stdio.h>
#include <string.h>

#define MAX  8
#define BASE 4
#define S 2
#define E 3
#define W 4
#define N 5

char map[MAX+1][MAX+1];
int  h[MAX+1][MAX+1];
char dice[7][7][7] = {{{0},{0},{0},{0},{0},{0},{0}},
	{{0},{0},{0,1,2,3,4,5,6},{0,1,3,5,2,4,6},{0,1,4,2,5,3,6},{0,1,5,4,3,2,6},{0}},
	{{0},{0,2,1,4,3,6,5},{0},{0,2,3,1,6,4,5},{0,2,4,6,1,3,5},{0},{0,2,6,3,4,1,5}},
	{{0},{0,3,1,2,5,6,4},{0,3,2,6,1,5,4},{0},{0},{0,3,5,1,6,2,4},{0,3,6,5,2,1,4}},
	{{0},{0,4,1,5,2,6,3},{0,4,2,1,6,5,3},{0},{0},{0,4,5,6,1,2,3},{0,4,6,2,5,1,3}},
	{{0},{0,5,1,3,4,6,2},{0},{0,5,3,6,1,4,2},{0,5,4,1,6,3,2},{0},{0,5,6,4,3,1,2}},
	{{0},{0},{0,6,2,4,3,5,1},{0,6,3,2,5,4,1},{0,6,4,5,2,3,1},{0,6,5,3,4,2,1},{0}}};

int mv[7][2] = {{0},{0},{1,0},{0,1},{0,-1},{-1,0},{0}};
int ans[7];

int main()
{
	int n, i, t, f, r, c, d, x, max;
	int r2, c2, t2, f2;

	while (scanf("%d", &n) && n > 0) {
		memset(h, 0, sizeof(h));
		for (i = 0; i < n; i++) {
			r = c = BASE;
			scanf("%d%d", &t, &f);
			while (h[r][c]) {
				for (max = 6; max >= 4; max--) for (d = 2; d <= 5; d++) {
					if (dice[t][f][d] == max) {
						r2 = r + mv[d][0], c2 = c + mv[d][1];
						if (h[r2][c2] < h[r][c]) goto next;
					}
				}
				break;

next:			x = dice[t][f][3];
				if      (d == S) t2 = 7-f, f2 = t;
				else if (d == E) t2 = 7-x, f2 = f;
				else if (d == W) t2 = x,   f2 = f;
				else /* d== N */ t2 = f,   f2 = 7-t;
				r = r2, c = c2, t = t2, f = f2;
			}
			map[r][c] = t, h[r][c]++;
		}

		memset(ans, 0, sizeof(ans));
		for (r = 0; r < MAX; r++) for (c = 0; c < MAX; c++)
			if (h[r][c] > 0) ans[map[r][c]]++;

		printf("%d", ans[1]);
		for (i = 2; i <= 6; i++) printf(" %d", ans[i]);
		putchar('\n');
	}
	return 0;
}