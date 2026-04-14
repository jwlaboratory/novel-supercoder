#include<stdio.h>
int main(void)

{
	int a,b,h,w;
	while(1){
	scanf("%d %d",&h,&w);
	if(h == 0 && w == 0){
		break;
	}
	for(a=0;a<h;a++){
		for(b=0;b<w;b++){
			printf("#",h);
		}
		printf("\n");
	}
	printf("\n");
}
return 0;
}