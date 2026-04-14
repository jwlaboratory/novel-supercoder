```c
#include<stdio.h>
int main(void)
{
	int t,n,s;
	int i;
	
	for(i=0;i<4;i++){
		scanf("%d %d",&t,&n);
		if(t==1){
			s=n*6000;
		}
		else if(t==2){
			s=n*4000;
		}
		else if(t==3){
			s=n*3000;
		}
		else if(t==4){
			s=n*2000;
		}
		printf("%d\n",s);
	}
	return 0;
}```