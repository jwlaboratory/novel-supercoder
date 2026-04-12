#include<stdio.h>

int main(void)
{
	void swap(int *,int *);
  	int x, y, z;
  
  	scanf("%d %d %d",&x,&y,&z);
  	
  	swap(&x, &y);
  	swap(&x, &z);
  
  	printf("%d %d %d\n",x, y ,z);
  
  	return 0;
}

void swap(int *a,int *b)
{
	int temp;
  	temp = *a;
  	*a = *b;
  	*b = temp;
}