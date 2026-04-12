```c
#include <stdio.h>

int main(){
	char A[11];
	scanf("%s", A);
	
	if (A[2] == A[3] && A[4] == A[5]){
		puts("Yes");
	}
	else{
		puts("No");
	}
		
	return 0;
}
```