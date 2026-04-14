#include <stdio.h>

int main(void)
{
	int vehicle[10];
	int i = 0;
	
	while (scanf("%d", &vehicle[i]) != EOF){
		if (vehicle[i] == 0){
			i--;
			printf("%d\n", vehicle[i]);
		}
		else {
			i++;
		}
	}
	
	return (0);
}