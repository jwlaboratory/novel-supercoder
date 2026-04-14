#include <stdio.h>

int main(void)
{
	int num;
	int i;
	int ans;
	
	for(i = 1; i < 10; i++){
		for(num = 1; num < 10; num++){
			ans = i * num;
			printf("%dx%d=%d\n", i, num, ans);
		}
	}
	
	return 0;
}