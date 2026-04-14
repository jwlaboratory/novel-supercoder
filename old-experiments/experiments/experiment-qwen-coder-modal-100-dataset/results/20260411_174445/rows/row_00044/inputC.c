#include <math.h>
#include <stdio.h>
#define PI 3.1415926536
int main() {
	double a, b, x;
	scanf("%lf%lf%lf", &a, &b, &x);
	if (a * a * b <= 2 * x) {
		printf("%.10f\n",
			   atan(2.0 * (a * a * b - x) / (a * a * a)) * 180.0 / PI);
	} else {
		printf("%.10f\n", atan(a * b * b / 2.0 / x) * 180.0 / PI);
	}
	return 0;
}