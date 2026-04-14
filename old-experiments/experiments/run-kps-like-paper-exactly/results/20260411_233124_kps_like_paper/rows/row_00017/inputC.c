#include <stdio.h>

int main(void)
{
	int n;
	int a, v;
	int i;
	int max_num, max;
	
	scanf("%d", &n);
	
	scanf("%d %d", &a, &v);
	max_num = a;
	max = v;
	
	for (i = 1; i < n; i++){
		scanf("%d %d", &a, &v);
		
		if (max < v){
			max_num = a;
			max = v;
		}
		else if (max == v && max_num > a){
			max_num = a;
		}
		
	}
	printf("%d %d\n", max_num, max);
	
	return (0);
}