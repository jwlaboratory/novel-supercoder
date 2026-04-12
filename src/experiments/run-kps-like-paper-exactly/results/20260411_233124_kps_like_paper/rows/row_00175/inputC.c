#include <stdio.h>

int main(){
    int n,i,max=0,sum=0;

    scanf("%d",&n);
    int p[n+1];

    for(i=1;i<=n;i++){
        scanf("%d",&p[i]);
    }

    for(i=1;i<=n;i++){
        if(p[i]>max){
            max=p[i];
        }
        sum+=p[i];
    }

    sum-=max/2;
    printf("%d",sum);
  
    return 0;
}