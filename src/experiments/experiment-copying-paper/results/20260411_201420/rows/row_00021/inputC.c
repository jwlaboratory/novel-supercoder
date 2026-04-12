```c
#include<stdio.h>
int main()
{
	char n[4];
	scanf("%s",n);
	if(n[0]==n[1]&&n[1]==n[2]||n[1]==n[2]&&n[2]==n[3]) printf("Yes\n");
	else printf("No\n");
	return 0;
}
```