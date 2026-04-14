#include<stdio.h>
int main(){
	int a,HH,MM;
	int i,j,k=0,l=0;
	int T[24][60]={};
	int flag=0;
	
	for(j=0;j<2;j++){
		scanf("%d",&a);
		for(i=0;i<a;i++){
			scanf("%d %d",&HH,&MM);
			T[HH][MM]=1;
		}
	}
	
	for(k=0;k<24;k++){
		for(l=0;l<60;l++){
			if(T[k][l]>0){
				
				if(flag!=0){
				printf(" ");
				}
				printf("%d:",k);
				flag=1;
				if(l<10){
 					printf("0%d",l);
				}else{
					printf("%d",l);
				}
			}
		}
	}
	printf("\n");
	return 0;
}