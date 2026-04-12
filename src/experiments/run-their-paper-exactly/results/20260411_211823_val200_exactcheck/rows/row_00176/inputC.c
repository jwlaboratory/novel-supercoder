```c
#include <stdio.h>

int main(void) {
	int machi, i, baibai, price[100000]={}, cnt=0, dif=-1, min;
	
	scanf("%d %d", &machi, &baibai);
	
	for(i=0;i<machi;i++)
	scanf("%d", &price[i]);
	
	min=price[0];
	
	for(i=0;i<machi;i++){
		if(min>price[i])
		min=price[i];
		
		if(dif<price[i]-min){
			dif=price[i]-min;
			cnt=1;
			continue;
		}
		
		if(dif==price[i]-min){
			cnt++;
		}
	}
	
	printf("%d\n", cnt);
	return 0;
}
```