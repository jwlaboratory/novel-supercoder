```c
#include<stdio.h>
int main()
{
	char s[4];
	scanf("%s",s);
	if(s[0]==s[1]&&s[0]==s[2]&&s[0]==s[3]){
		printf("No\n");
	}
	else if(s[0]==s[1]&&s[2]==s[3]||s[0]==s[2]&&s[1]==s[3]||s[0]==s[3]&&s[1]==s[2]){
		printf("Yes\n");
	}
	else{
		printf("No\n");
	}
	return 0;
}```