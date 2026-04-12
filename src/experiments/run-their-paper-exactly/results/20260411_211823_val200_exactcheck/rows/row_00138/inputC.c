```c
#include <stdio.h>
#include <stdlib.h>

int main(void){
	int A, B, C, X;
	int total;
	int count;
	int i, j, k;

	scanf("%d %d %d %d", &A, &B, &C, &X);
	count = 0;
	i = 0;
	while (i <= A){
		j = 0;
		while (j <= B){
			k = 0;
			while (k <= C){
				total = 500*i + 100*j + 50*k;
				if (total == X){
					count++;
				}
				k++;
			}
			j++;
		}
		i++;
	}
	printf("%d\n", count);
	return (0);
}
```