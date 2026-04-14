// AOJ 2710 An Equation in a Mine
// 2018.2.14 bal4u

#include <stdio.h>
#include <ctype.h>
#include <string.h>

#define INF 0x10101010

unsigned char s[202], sgn[202], num[202];
int min[202][202], max[202][202];

int main()
{
	int n, i, j, k, l, x;
	unsigned char *p, *qs, *qn;

	fgets(p=s, 202, stdin);
	qs = sgn, qn = num;	for (i = 0; *p >= ' '; i++) {
		if (isdigit(*p)) *qn++ = i;
		else if (*p == '+' || *p == '-') *qs++ = i;
		p++;
	}
	n = qn - num;

	memset(min,  INF, sizeof(min));
	memset(max, -INF, sizeof(max));
    for (i = 0; i < n; i++) min[i][i] = max[i][i] = s[num[i]] & 0xf;

	for(l = 1; l < n ; l++) for(i = 0; (j=i+l) < n; i++) {
		for (k = i; k < j; k++) {
			if (  i != k && (s[num[  i]+1] == ')' || s[num[k]-1] == '(')) continue;
			if (k+1 != j && (s[num[k+1]+1] == ')' || s[num[j]-1] == '(')) continue;

			if (s[sgn[k]] == '+') {
				x = max[i][k] + max[k+1][j];
				if (max[i][j] < x) max[i][j] = x;
				x = min[i][k] + min[k+1][j];
				if (min[i][j] > x) min[i][j] = x;
			} else {
				x = max[i][k] - min[k+1][j];
				if (max[i][j] < x) max[i][j] = x;
				x = min[i][k] - max[k+1][j];
				if (min[i][j] > x) min[i][j] = x;
            }
        }
    }
    printf("%d\n", max[0][n-1]);
    return 0;
}
