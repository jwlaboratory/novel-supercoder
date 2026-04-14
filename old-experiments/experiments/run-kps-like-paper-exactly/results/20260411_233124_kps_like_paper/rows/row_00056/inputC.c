#include<stdio.h>

int main(void)
{
	int N;
	int a;
	int b;
	int c;
	int i;
	
	scanf("%d", &N);
	
	for(i = 0;i < N;i++){
		scanf("%d %d %d", &a, &b, &c);
		
		if((a * a) + (b * b) == (c * c) || (c * c) + (b * b) == (a * a) || (a * a) + (c * c) == (b * b)){
			printf("YES\n");
		}
		else {
			printf("NO\n");
		}
	}
	
	return (0);
}