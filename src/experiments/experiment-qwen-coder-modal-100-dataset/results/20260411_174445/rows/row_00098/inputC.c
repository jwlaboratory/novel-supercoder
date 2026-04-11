#include <stdio.h>

int main()
{
	char S[100001];
	scanf("%s", S);
	
	int l, r, n;
	for (n = 0; S[n] != 0; n++);
	for (l = n / 2; l > 0 && S[l] == S[l-1]; l--);
	for (r = (n - 1) / 2; r < n - 1 && S[r] == S[r+1]; r++);
	if (l < n - r - 1) printf("%d\n", r + 1);
	else printf("%d\n", n - l);
	fflush(stdout);
	return 0;
}