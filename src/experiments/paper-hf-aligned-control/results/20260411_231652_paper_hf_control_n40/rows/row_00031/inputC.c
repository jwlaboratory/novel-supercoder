```c
#include<stdio.h>
int main()
{
	char s[19];
	int len,i;
	gets(s);
	len=strlen(s);
	for(i=0; i<len; i++)
	{
		if(s[i]!=',')
			printf("%c",s[i]);
		else
			printf(" ");
	}
	printf("\n");
	return 0;
}```