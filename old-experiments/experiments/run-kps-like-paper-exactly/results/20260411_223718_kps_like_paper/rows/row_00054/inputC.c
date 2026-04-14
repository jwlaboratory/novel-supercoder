#include<stdio.h>


int main() 
{
	int a = 1, b = 1;
	while (b<=9) {
		printf("%dx%d=%d\n", b, a, a*b);
		a++;
		if (a >= 10) {
			b++;
			a = 1;
		}
	}
	return 0;
}