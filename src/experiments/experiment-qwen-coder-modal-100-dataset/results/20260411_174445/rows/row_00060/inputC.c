#include <stdio.h>
int main(){
	long long N;
	scanf("%lld",&N);
	printf("%d\n",N?64-__builtin_clzll(N):0);
	return 0;
}