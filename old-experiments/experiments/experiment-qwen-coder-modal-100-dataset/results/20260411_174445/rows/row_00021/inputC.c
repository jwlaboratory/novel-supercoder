#include <stdio.h>
#include <math.h>

#define PI 3.1415926535897932384626433832795028841

int isreach(int x,int y,int wangle,int wpower,int fangle) {
	double angle1,angle2,angle3,angle4;
	if(x*x+y*y>wpower*wpower)return 0;
	angle1=atan2(y,x);
	angle2=wangle*PI/180.0;
	angle3=fangle*PI/180.0;
	angle4=fabs(angle1-angle2);
	while(angle4>=PI*2)angle4-=PI*2;
	if(angle4>PI)angle4=PI*2-angle4;
	return angle4<=angle3/2;
}

int main(void) {
	int H,R;
	int housex[100],housey[100],houseok[100];
	int U,M,S,du,dm,ds;
	int ux[10],uy[10],mx[10],my[10],sx[10],sy[10];
	int w,a;
	int i,j,k;
	int ok,max;
	while(scanf("%d%d",&H,&R)==2 && (H|R)!=0) {
		for(i=0;i<H;i++) {
			scanf("%d%d",&housex[i],&housey[i]);
			houseok[i]=0;
		}
		scanf("%d%d%d%d%d%d",&U,&M,&S,&du,&dm,&ds);
		for(i=0;i<U;i++)scanf("%d%d",&ux[i],&uy[i]);
		for(i=0;i<M;i++)scanf("%d%d",&mx[i],&my[i]);
		for(i=0;i<S;i++)scanf("%d%d",&sx[i],&sy[i]);
		for(i=0;i<R;i++) {
			scanf("%d%d",&w,&a);
			for(j=0;j<H;j++) {
				if(isreach(housex[j],housey[j],w,a,du)) {
					ok=1;
					for(k=0;k<U;k++) {
						if(isreach(housex[j]-ux[k],housey[j]-uy[k],w,a,du)) {
							ok=0;
							break;
						}
					}
					if(ok) {
						for(k=0;k<M;k++) {
							if(isreach(housex[j]-mx[k],housey[j]-my[k],w,a,dm)) {
								ok=0;
								break;
							}
						}
					}
					if(ok) {
						for(k=0;k<S;k++) {
							if(isreach(housex[j]-sx[k],housey[j]-sy[k],w,a,ds)) {
								ok=0;
								break;
							}
						}
					}
					if(ok)houseok[j]++;
				}
			}
		}
		max=0;
		for(i=0;i<H;i++) {
			if(houseok[i]>max)max=houseok[i];
		}
		if(max==0)puts("NA");
		else {
			ok=0;
			for(i=0;i<H;i++) {
				if(houseok[i]==max) {
					if(ok)putchar(' ');
					printf("%d",i+1);
					ok=1;
				}
			}
			putchar('\n');
		}
	}
	return 0;
}