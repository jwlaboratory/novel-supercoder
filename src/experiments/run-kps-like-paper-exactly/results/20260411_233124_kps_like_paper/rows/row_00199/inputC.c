#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

int main(int argc, char const *argv[])
{
	int d;
	scanf("%d",&d);
	printf("Christmas");
	for (int i = 0; i < abs(d - 25); ++i)	printf(" Eve");
	printf("\n");
	return 0;
}