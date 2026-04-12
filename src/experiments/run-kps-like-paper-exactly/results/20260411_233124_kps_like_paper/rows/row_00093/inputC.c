#include <stdio.h>
int main(void)
{
	int a1,a2,a3,a4;
	int b1,b2,b3,b4;
	int s,t;
	
	scanf("%d %d %d %d",&a1,&a2,&a3,&a4);
	scanf("%d %d %d %d",&b1,&b2,&b3,&b4);
	
	s=a1+a2+a3+a4;
	t=b1+b2+b3+b4;
	
	printf("%d\n",(s>t)?s:t);
	
	return 0;
}