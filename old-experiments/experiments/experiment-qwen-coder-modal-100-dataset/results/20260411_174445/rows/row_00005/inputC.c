// Aizu 0204: UFO Shooting Down Operation
// 2017.9.11 bal4u@uu

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define EPS 1e-7

typedef struct { double a, d; int r, v; char f; } T;
T ufo[103]; int n, m;

double equ2(double a, double b, double c)  // ax^2 + bx + c = 0
{
    double d = b*b - 4*a*c;     /* ????????? */
    double x1 = 0.0;            /* ?§£ */
    if (d > EPS || d >= 0) x1 = (-b + sqrt(d)) / (2*a);
    return x1;
}

int cmp(T *a, T *b)
{
    double x;
	if (b->f - a->f) return (int)(b->f - a->f);
	x = a->d - b->d;
    if (fabs(x) <= EPS) return 0;
    if (x <= 0) return -1; else return 1;
}

int hit(int k, double aa, double lim)
{
	double a, b, c;
	double d, r, x;

	b = fabs(ufo[k].a - aa), d = ufo[k].d, r = ufo[k].r;
	a = 1.0, b = -2.0*d*cos(b), c = d*d-r*r;
	x = equ2(a, b, c);
	if (fabs(x - lim) > EPS && x >= lim) return 1;
	return 0;
}

int main()
{
    int i, x, y, ans, t;
	double a, r;

	while (scanf("%d%d", &t, &n) && t) { r = t;
        for (ans = 0, m = n, i = 0; i < n; i++) {
            scanf("%d%d%d%d", &x, &y, &ufo[i].r, &ufo[i].v), ufo[i].f = 1;
            if (x == 0 && y == 0) ufo[i].f = 0, ans++, m--;
            ufo[i].a = atan2((double)y, (double)x);
            ufo[i].d = sqrt(x*x + y*y)-ufo[i].v;
        }
        while (m > 0) {
			qsort(ufo, n, sizeof(T), cmp);
			for (i = 0; i < n; i++) if (ufo[i].f) {
				if (fabs(ufo[i].d - r) <= EPS || ufo[i].d <= r) { ufo[i].f = 0, m--, ans++; continue; }
				ufo[i].f = 0, m--;	// fire
				a = ufo[i].a;
				break;
			}
			for (i = 0; i < n; i++) if (ufo[i].f) {
				if (hit(i, a, r)) ufo[i].f = 0, m--;
			}
			for (i = 0; i < n; i++) if (ufo[i].f) {
				ufo[i].d -= ufo[i].v; { if (ufo[i].d <= 0) ufo[i].f = 0, m--, ans++; }
			}
		}
		printf("%d\n", ans);
	}
	return 0;
}