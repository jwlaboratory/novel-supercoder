#include <stdio.h>

int a;
int b;
int num;

num=1;
a=1;
b=0;

int main(void){
	
	for (num=1;num<82;num++){
		b=b+1;
		if (b==10){
			b=1;
			a=a+1;
					}

		printf("%dx%d=%d\n",a,b,a*b);
								}
	return 0;
}