```c
#include <stdio.h>

int a[200000];
int b[200000];

int main(void)
{
	int n, m, i, j;
	scanf("%d", &n);
	for (i = 0; i < n; i++) {
		scanf("%d", a + i);
	}
	scanf("%d", &m);
	for (i = 0; i < m; i++) {
		scanf("%d", b + i);
	}
	for (i = j = 0; i < n && j < m; i++) {
		j += a[i] == b[j];
	}
	puts(j == m ? "1" : "0");
	return 0;
}

```