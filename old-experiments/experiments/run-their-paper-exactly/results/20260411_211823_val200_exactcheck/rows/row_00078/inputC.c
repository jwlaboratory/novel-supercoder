```c
#include <math.h>
double x[99],y[99],X,Y;
n,i;main(){
	for(gets(x);~scanf("%lf %lf",x+n,y+n);n++);
	if(!(n&1))for(X=(x[0]+x[n/2])/2,Y=(y[0]+y[n/2])/2,i=1;
		i<n/2&&fabs((x[i]+x[n/2+i])/2-X)<1e-7&&fabs((y[i]+y[n/2+i])/2-Y)<1e-7;
	i++);
	printf(i==n/2?"%f %f\n":"NA\n",X,Y);exit(0);
}```