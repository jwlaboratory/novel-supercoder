```c
#include <stdio.h>

int main(void) {
	// your code goes here
	int a,b,c;
	scanf("%d %d %d",&a,&b,&c);
	if(a <= c && b >= c){
		printf("Yes");
	}
	else{
		printf("No");
	}
	return 0;
}
```