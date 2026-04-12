#include<stdio.h>
int a[1000000]={0};

int main(void){
int i,j,b,c;
while(scanf("%d",&b)!=EOF){
c=0;
for(i=2;i<=b;i++){
    if(a[i]==1)continue;
            if(a[i]==0){
            c++;
            }
    for(j=2;i*j<=b;j++){
        a[i*j]=1;
    }
     //if(a[i]==0){
    //printf("%d\n",i);
    //}
}
    printf("%d\n",c);
}
return 0;
}