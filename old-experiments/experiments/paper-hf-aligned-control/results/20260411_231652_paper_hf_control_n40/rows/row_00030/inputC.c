```c
#include<stdio.h>
int main(){
	int flag,min,MAX,i,I,x,y,z,N,M,a[1000],weight;
	scanf("%d %d",&N,&M);
	for(i=0;i<N;i++){
		scanf("%d",&a[i]);
	}
	for(i=1;;i++){
		x = N*i;
		if((x%M)==0) break;
	}
	y = x/M;
	min = a[0];
	MAX = a[0];
	I = 0;
	flag = 1;
	weight = 0;
	for(i=0;i<y;i++){
		for(;I<(M*flag);I++){
			z = I % N;
			if(min>a[z]) min = a[z];
			if(MAX<a[z]) MAX = a[z];
		}
		flag++;
		weight = weight + MAX - min;
		z = I % N;
		MAX = a[z];
		min = a[z];
	}
	printf("%d\n",weight);
	return 0;
}```