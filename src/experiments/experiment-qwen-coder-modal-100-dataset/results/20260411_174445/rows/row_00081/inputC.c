#include <stdio.h>

int N, K;
int Dis[11];
int Divider[5] = {10000, 1000, 100, 10, 1};

int main(void) 
{
	int i, tmp, min, max, min_not_zero;
	int cnt = 1;
	int flag = 0;
	int idx = 0;
	
	scanf("%d %d", &N, &K);
	for (i = 0; i < K; i++)
	{
		scanf("%d", &tmp);
		Dis[tmp] = 1;
	}
	
	tmp = N;
	while (tmp /= 10) {
		cnt++;		
	}

	while (Dis[idx++]);
	min = idx - 1;
	
	idx = 1;
	while (Dis[idx++]);
	min_not_zero = idx - 1;

	idx = 9;
	while (Dis[idx--]);
	max = idx + 1;

	for (i = (4 - cnt) + 1; i <= 4; i++) tmp += (max * Divider[i]);

	if (tmp < N)
	{
		tmp = min_not_zero * Divider[4-cnt];
		for (i = (4 - cnt) + 1; i <= 4; i++)
		{
			tmp += min * Divider[i];
		}
		printf("%d\n", tmp);

		return 0;
	}

	for (i = (4 - cnt) + 1; i <= 4; i++)
	{
		idx = 0;
		if (flag) {printf("%d", min); continue;}
		
		tmp = (N / Divider[i]) % 10;
		
		while (Dis[tmp + idx++]);
		idx--;
	
		if (idx >= 1)
		{
			flag = 1;
			Divider[i] = tmp + idx;
		}
		else Divider[i] = tmp;

		if (Divider[i] == 10 && i != (4-cnt)) Divider[i] = 0;
		printf("%d", Divider[i]);
	}
	printf("\n");

	return 0;
}