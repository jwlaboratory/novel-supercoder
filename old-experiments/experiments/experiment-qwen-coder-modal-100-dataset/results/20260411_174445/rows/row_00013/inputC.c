#include <stdio.h>
#include <stdint.h>
typedef uint64_t ull;
typedef  int64_t sll;

ull h, w, k;
char s[3010][3010], t[3010][3010];

void drop () {
	sll i, j;
	for (j = 0; j < w; j++) {
		sll bottom = h - 1;
		for (i = h - 1; i >= 0; i--) {
			if (t[i][j]) {
				t[bottom--][j] = t[i][j];
			}
		}
		while (bottom >= 0) {
			t[bottom--][j] = '\0';
		}
	}
}

ull rensa () {
	sll i, j;
	ull r = 0;
	for (i = 0; i < h; i++) {
		j = 0;
		while (j < w) {
			if (!t[i][j]) {
				j++;
				continue;
			}

			sll ki = j;
			while (j < w && t[i][j] == t[i][ki]) j++;

			if (j - ki >= k) {
				r += (j - ki) * (t[i][ki] - '0');
				while (ki < j) {
					t[i][ki] = '\0';
					ki++;
				}
			}
		}
	}

	return r;
}

ull f (ull a, ull b) {
	sll i, j;
	for (i = 0; i < h; i++) {
		for (j = 0; j < w; j++) {
			t[i][j] = s[i][j];
		}
	}
	t[a][b] = '\0';

	ull r = 0;
	for (i = 0; ; i++) {
		drop();
		ull x = rensa() << i;
		if (!x) return r;

		r += x;
	}
}

ull solve () {
	ull result = 0;
	if (k > 3) {
		puts("0");
		return 1;
	}

	for (sll i = 0; i < h; i++) {
		for (sll j = 0; j < w; j++) {
			ull item = f(i, j);
			if (item > result) result = item;
		}
	}

	printf("%lld\n", result);
	return 0;
}

int32_t main (void) {
	int32_t i, j;
	int32_t x, y;

	scanf("%llu%llu", &h, &w);
	scanf("%llu", &k);
	for (i = 0; i < h; i++) {
		scanf("%s", &s[i]);
	}

	solve();

	return 0;
}
