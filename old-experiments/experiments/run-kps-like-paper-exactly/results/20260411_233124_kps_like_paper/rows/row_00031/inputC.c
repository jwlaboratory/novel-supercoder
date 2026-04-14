#include <stdio.h>

int main(void)          
{
	long long int a[100][100], b[100][100],c[100][100];
	int n, m, l;
	int i, j, k;
	scanf("%d %d %d", &n, &m, &l);
	for (i = 0; i < n; i++)
	{
		for (j = 0; j < l; j++)
		{
			c[i][j] = 0;
		}
	}
	
	for (i = 0; i < n; i++) 
	{
		for (j = 0; j < m; j++)
		{
			scanf("%d", &a[i][j]);
		}
	}
	for (i = 0; i < m; i++)
	{
		for (j = 0; j < l; j++)
		{
			scanf("%d", &b[i][j]);
		}
	}
	for (i = 0; i < n; i++)
	{
		for (j = 0; j < l; j++)
		{
			for (k = 0; k < m; k++)
			{
				c[i][j] += a[i][k] * b[k][j];
			}
		}
	}
	for (i = 0; i < n; i++)
	{
		for (j = 0; j < l; j++)
		{
			printf("%lli", c[i][j]);
			if (j != l - 1) printf(" ");
		}
		printf("\n");
	}
	return 0;
}