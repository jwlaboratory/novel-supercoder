```c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#define Rep(i,a,n)for(int i=(int)(a);i<(int)(n);i++)
#define rep(i,n)Rep(i,0,n)
typedef long long ll;
typedef long double ld;

int main() {
	int a=0, b=0, c=0, flag=0;
	char s;
	rep(i, 100001) {
		scanf("%c", &s);
		if (s == 'a')a++;
		else if (s == 'b')b++;
		else if (s == 'c')c++;
		else break;
	}
	if (fabs(b - a) > 1 || fabs(c - b) > 1 || fabs(a - c) > 1)printf("NO");
	else printf("YES");
}
```