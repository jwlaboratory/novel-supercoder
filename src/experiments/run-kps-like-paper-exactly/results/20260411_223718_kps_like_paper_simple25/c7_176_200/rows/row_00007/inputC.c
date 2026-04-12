#include<stdio.h>
int main(void)
{
	int i,j,a[9]={1,2,3,4,5,6,7,8,9};
	for(i=0;i<9;i++)
	{
		for(j=0;j<9;j++)
		{
			printf("%dx%d=%d\n",a[i],a[j],a[i]*a[j]);
		}
	}
	return 0;
}