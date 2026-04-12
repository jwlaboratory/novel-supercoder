```c
#include <stdio.h>
	int main(){
		int paper, page;
		scanf("%d", &page);
		if (page%2==0){
			paper = page/2;
		}
		else {
			paper = page/2+1;
		}
		printf("%d", paper);
		return 0;
	}
```