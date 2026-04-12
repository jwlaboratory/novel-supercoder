#include<stdio.h>
int ans;
int d[202][202];
void solve(int g[], int n[], int gn, int nn)
{
	if (nn == 0)
	{
		int scor = 0;
		int i;
		for (i = 0; i < gn - 1; i++)
			scor += d[g[i]][g[i + 1]];
		if (ans > scor)
			ans = scor;
	}
	else
	{
		int a[11], b[11];
		int i, j, k;
		for (i = 0; i < nn; i++)
		{
			k = 0;
			for (j = 0; j < nn; j++)
			{
				if (i != j)
				{
					a[k] = n[j];
					k++;
				}
			}
			for (j = 0; j < gn; j++)
				b[j] = g[j];
			b[gn] = n[i];
			solve(b, a, gn + 1, nn - 1);
		}
	}
	return;
}
int main()
{
	int n, m, R;
	scanf("%d %d %d", &n, &m, &R);
	int i, j, k;
	int r[10];
	for (i = 0; i < R; i++)
	{
		scanf("%d", &r[i]);
		r[i]--;
	}
	int a[20004], b[20004], c[20004];
	for (i = 0; i < m; i++)
	{
		scanf("%d %d %d", &a[i], &b[i], &c[i]);
		a[i]--;
		b[i]--;
	}
	for (i = 0; i < n; i++)
		for (j = 0; j < n; j++)
			d[i][j] = 1e9;
	for (i = 0; i < m; i++)
		d[a[i]][b[i]] = d[b[i]][a[i]] = c[i];
	for (k = 0; k < n; k++)
		for (i = 0; i < n; i++)
			for (j = 0; j < n; j++)
				if (d[i][j] > d[i][k] + d[k][j])
					d[i][j] = d[i][k] + d[k][j];
	ans = 1e9;
	int p[10] = {};
	solve(p, r, 0, R);
	printf("%d\n", ans);
	return 0;
}