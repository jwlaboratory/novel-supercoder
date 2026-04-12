#include<stdio.h>

int main(){
	int a,b;
	double fa,fb;

	scanf("%d%d",&a,&b);
	fa=a;
	fb=b;
	printf("%d %d %f\n",a/b,a%b,fa/fb);

	return 0;
}