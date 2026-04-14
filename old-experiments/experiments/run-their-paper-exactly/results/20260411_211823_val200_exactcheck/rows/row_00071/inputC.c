```c
#include<stdio.h>
int main()
{
	int n, m;
	scanf("%d %d", &n, &m);
	int i;
	int a, b;
	int count[100005];
	for (i = 0; i < n; i++)
		count[i] = 0;
	for (i = 0; i < m; i++)
	{
		scanf("%d %d", &a, &b);
		count[a - 1]++;
		count[b - 1]++;
	}
	for (i = 0; i < n; i++)
	{
		if (count[i] % 2 > 0)
		{
			printf("NO\n");
			return 0;
		}
	}
	printf("YES\n");
	return 0;
}```