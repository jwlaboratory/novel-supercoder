#include <stdio.h>

int main(void)
{
	int tr[12];
	int num, i, n;
	
	num = 0;
	
	while (scanf("%d", &n) != EOF){
		
		if (n == 0){
			num--;
			printf("%d\n", tr[num]);
			
		}
		else {
			tr[num] = n;
			num++;
		}
	}
	
	return (0);
}