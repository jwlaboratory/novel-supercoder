```c
#include <stdio.h>
#include <string.h>

char str[100005];

int isUnb(char *p);
int f(char *p);

int main()
{
	int length;

	scanf("%s", str);

	length = strlen(str);
	for (int i = 0; i < length - 1; i++) {
		if (f(str + i)) {
			printf("%d %d\n", i + 1, i + 2);
			return 0;
		}
		if (isUnb(str + i)) {
			printf("%d %d\n", i + 1, i + 3);
			return 0;
		}
	}

	printf("-1 -1\n");

	return 0;
}

int isUnb(char *p)
{
	if (p[0] == p[1] || p[0] == p[2] || p[1] == p[2]) {
		return 1;
	} else {
		return 0;
	}
}

int f(char *p)
{
	if (p[0] == p[1]) {
		return 1;
	} else {
		return 0;
	}
}
```