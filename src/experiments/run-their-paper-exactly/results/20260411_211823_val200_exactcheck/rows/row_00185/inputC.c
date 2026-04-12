```c
#include <stdio.h>
#define MAX 1000000
int main(void){
    // Your code here!
    int K,flag=1;
    scanf("%d",&K);
    int mod=7;
    for(int i=0;i<MAX;i++){
        mod=mod%K;
        if(mod==0) {
            printf("%d",i+1);
            flag =0;
            break;
        }
        else{
        mod=mod*10 +7;
        }
    }
    if(flag==1) printf("-1");
    return 0;
}```