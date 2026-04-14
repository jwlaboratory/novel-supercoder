
#include <stdio.h>

int main(void){
	int num1, num2;

	for (num1 = 1; num1 <= 9; num1++){
		for (num2 = 1; num2 <= 9; num2++){
			printf("%dx%d=%d\n", num1, num2, num1*num2);
		}
	}
	return 0;
}