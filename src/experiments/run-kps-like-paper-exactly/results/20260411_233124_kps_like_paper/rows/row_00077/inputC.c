#include <stdio.h>
int main()
{
	int a,b;
	while(1)	
	{
		scanf("%d%d",&a,&b);
		if(a==0&&b==0)
		break;
		for(int i=1;i<=a;i++)
		{
			for(int j=1;j<=b;j++)
			{
				if(i==1||i==a||j==1||j==b)
				printf("#");
				else 
				printf(".");
			}
			printf("\n");
		}
		printf("\n");
	}
	return 0;
 } 
