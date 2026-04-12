```c
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(void) {
	int i;
	int x, y;
	int group[13];
	char buf[128], *ch;
	group[0] = 0;
	group[1] = 1;
	group[2] = 3;
	group[3] = 1;
	group[4] = 2;
	group[5] = 1;
	group[6] = 2;
	group[7] = 1;
	group[8] = 1;
	group[9] = 2;
	group[10] = 1;
	group[11] = 2;
	group[12] = 1;

	fgets(buf, sizeof(buf), stdin);
	ch = strtok(buf, " ");
	x = atoi(ch);
	ch = strtok(NULL, " ");
	y = atoi(ch);

	if(group[x] == group[y]) {
		printf("Yes\n");
	} else {
		printf("No\n");
	}

	return 0;
}
```