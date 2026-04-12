```c
#include<stdio.h>

int main(){
    int k,s;
    scanf("%d%d",&k,&s);

    int count=0;
    int x,y;
    for(x=0;x<=k;x++){
        for(y=0;y<=k;y++){
            if(0<=(s-x-y)&&(s-x-y)<=k){
                count++;
            }
        }
    }
    printf("%d\n",count);
    return 0;
}```