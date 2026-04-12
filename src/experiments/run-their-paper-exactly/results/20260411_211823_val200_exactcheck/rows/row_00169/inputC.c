```c
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int D,E,i;
double r,t;
int main()
{
	for(;scanf("%d%d",&D,&E),D;)
	{
		r=10000000;
		for(i=0;i<=D/2;i++)
		{
			t=sqrt(1.0*i*i+(D-i)*(D-i))-E;
			if(t<0)t*=-1;
			r=r-t>=0.001?t:r;
		}
		printf("%lf\n",r);
	}
	return 0;
}```