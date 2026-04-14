```c
#include <stdio.h>

int N;
int a[114514];

int main(void) {
	int i;
	int minIndex, minValue;
	if (scanf("%d", &N) != 1) return 1;
	for (i = 0; i < N; i++) {
		if (scanf("%d", &a[i]) != 1) return 1;
	}
	minIndex = 0;
	minValue = a[0];
	for (i = 1; i < N; i++) {
		if (a[i] < minValue) {
			minIndex = i;
			minValue = a[i];
		}
	}
	printf("%d\n", minIndex + 1);
	return 0;
}

```