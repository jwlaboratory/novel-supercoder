#include <stdio.h>

int main(void)
{
	int i;
	int j;
	
	for (i = 1; i <= 9; i++) {
		for (j = 1; j <= 9; j++) {
			printf("%dx%d=%d\n", i, j, j * i);
		}
	}
	
	return (0);
}