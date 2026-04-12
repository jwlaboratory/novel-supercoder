#include <stdio.h>

int main(void)
{
	int a,o,j;
	
	for(a=1;a<=9;a++){
		for(j=1;j<=9;j++){
			o=a*j;
			printf("%dx%d=%d\n",a,j,o);
		}
	}
	return 0;
}