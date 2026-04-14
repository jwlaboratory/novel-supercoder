#include <stdio.h>
#include <stdlib.h>

int main(){
    int N;
    scanf("%d",&N);
    if(N%2==0){
        printf("%d",N/2);
    }else{
        printf("%d",N/2+1); 
    }
}