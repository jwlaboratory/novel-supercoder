```c
#include<stdio.h>
int main(void)
{
	int a, b, c, d, e, f, g,h,hi,ke;
	scanf("%d %d", &a, &b);
	scanf("%d %d", &c, &d);
	scanf("%d %d %d %d", &e, &f, &g, &h);
	hi = a*e + b*f + a / 10 * g + b / 20 * h;
	ke = c*e + d*f + c / 10 * g + d / 20 * h;
	if (hi == ke)
	{
		printf("even\n");
	}
	else if(hi > ke)
	{
		printf("hiroshi\n");
	}
	else
	{
		printf("kenjiro\n");
	}
	return 0;
}```