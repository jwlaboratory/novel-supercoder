#include<stdio.h>
int main(void)
{
    int a[5],i,j,k;
    int x=0;

    scanf("%d%d%d%d%d",&a[0],&a[1],&a[2],&a[3],&a[4]);

    for(i=0;i<5;i++){
        for(j=0;j<5;j++){
            if(a[i]>a[j]){
                x=a[i];
                a[i]=a[j];
                a[j]=x;
            }
        }
    }
    for(k=0;k<4;k++){
        printf("%d ",a[k]);
    }
	printf("%d\n",a[4]);
    return 0;
}