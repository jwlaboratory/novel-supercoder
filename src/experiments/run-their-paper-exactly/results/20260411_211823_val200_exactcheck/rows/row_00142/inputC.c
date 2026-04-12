```c
#include<stdio.h>
int main(void){
	char s[10];
	int i,max=0,cnt=0;
	scanf("%s",s);
	for(i=0;s[i]!='\0';i++){
		if(s[i]=='A'||s[i]=='C'||s[i]=='G'||s[i]=='T'){
			cnt++;
		}
		else{
			cnt=0;
		}
		max=max<cnt?cnt:max;
	}
	printf("%d",max);
	return 0;
}```