```c
#include <stdio.h>
#include <string.h>

int main(){
	char a[20];
	scanf("%s", &a);
	memset(a+3, '\0', 17);
	printf("%s\n", a);

	return 0;
}```