```c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

int main()
{
	int N=0,K=0,count=0;

	scanf("%d %d",&N,&K);

	

	if((N-1)%(K-1)==0){
		count = (N-1)/(K-1);
	}
	
	else{
		count = (N-1)/(K-1)+1;
	}


	
		printf("%d",count);

	return 0;
}
```