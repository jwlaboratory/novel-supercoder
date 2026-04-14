```c
#include<stdio.h>

int main () {
	int n, m;
	scanf("%d %d", &n, &m);
	char s[n];
	scanf("%s", s);
	if(s[m-1] >= 'A' && s[m-1] <= 'Z') {
		s[m-1] += 32;
	} else {
		s[m-1] -= 32;
	}
	printf("%s", s);
	return 0;
}```