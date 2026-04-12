```c
#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>
#include<string.h>
#include<math.h>
#include<ctype.h>

typedef long long ll;

int main() {
	ll a, b, c;
	scanf("%lld%lld%lld", &a, &b, &c);
	ll d = c - a - b;
	if (d>0&&4*a*b<d*d) {
		printf("Yes\n");
	}
	else printf("No\n");

	return 0;
}
```