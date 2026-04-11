#include <stdio.h>

int main() {
	int a, b, c, date = 0;
	int week;
	int ans;
	scanf("%d %d %d",&a, &b, &c);

	week = a * 7 + b;

	date += c / week;
	ans = date * 7;
	 
	c -= week * date;

	if (c < a * 7) {
		if (c%a == 0) {
			ans += c / a;
		}
		else {
			ans += c / a + 1;
		}
	}
	else {
		ans += 7;
	}

	printf("%d\n", ans);
}
