```c
#include<stdio.h>
int main()
{
	int x,y;
	int i,f1=0,f2=0,flg=0;
	int a[7]={1,3,5,7,8,10,12},b[4]={4,6,9,11};
	scanf("%d %d",&x,&y);
	if(x==2&&y==2) flg=1;
	for(i=0;i<7;i++){
		if(x==a[i]) f1=1;
		if(y==a[i]) f2=1;
	}
	if(f1==1&&f2==1) flg=1;
	f1=0;f2=0;
	for(i=0;i<4;i++){
		if(x==b[i]) f1=1;
		if(y==b[i]) f2=1;
	}
	if(f1==1&&f2==1) flg=1;
	if(flg==1){
		printf("Yes\n");
	}
	else{
		printf("No\n");
	}
	return 0;
}```