#include<stdio.h>
int main()
{
	int i,i2;
	for(i=1;i!=10;i++){
		for(i2=1;i2!=10;i2++){
			printf("%dx%d=%d\n",i,i2,i*i2 );
		}
	}
	return 0;
}