#include<stdio.h>
int main (void){
    int a,i,ans=0;
    for(i=0;i<10;i++){
        scanf("%d",&a);
        ans+=a;
    }
    printf("%d\n",ans);
return 0;
}