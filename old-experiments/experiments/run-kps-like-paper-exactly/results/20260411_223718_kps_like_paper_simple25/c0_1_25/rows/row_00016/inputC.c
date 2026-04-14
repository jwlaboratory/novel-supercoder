#include<stdio.h>

int main(){
    int i,j;
    for(i=1;i<=9;i++){
      for(j=1;j<=9;j++){
        int ans = i * j;
        printf("%dx%d=%d\n",i,j,ans);
      }
    } 
    return 0;
}