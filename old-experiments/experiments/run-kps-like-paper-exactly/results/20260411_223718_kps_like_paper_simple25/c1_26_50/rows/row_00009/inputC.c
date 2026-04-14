#include <stdio.h>
int main()
{
	int i,j,k;
	k=9;
	for(i=1;i<=k;i++)
		for(j=1;j<=k;j++)
		{
			printf("%dx%d=%d\n",i,j,i*j);
		}
   return 0;
}