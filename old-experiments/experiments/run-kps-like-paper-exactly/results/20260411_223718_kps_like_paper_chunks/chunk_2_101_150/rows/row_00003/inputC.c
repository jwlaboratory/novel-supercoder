#include<stdio.h>
int main()
{
	int i,t,result;
	for(i=1;i<10;i++){
		for(t=1;t<10;t++){
		result=i*t;
		printf("%dx%d=%d\n",i,t,result);
		}
	}
	
	return 0;
}