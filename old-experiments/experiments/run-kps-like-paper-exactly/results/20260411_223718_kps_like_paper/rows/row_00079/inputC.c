#include<stdio.h>
int main (void){
    int ans,i,j;
    for(i=1;i<=9;i++){
        for(j=1;j<=9;j++){
            ans=i*j;
            printf("%dx%d=%d\n",i,j,ans);
        }
    }
return 0;
}