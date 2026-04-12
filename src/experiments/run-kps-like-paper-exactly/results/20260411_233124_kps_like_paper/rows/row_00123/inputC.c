#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#define N 13
#define pi M_PI

int main(){
    int n;
    scanf("%d",&n);
    int count;
    for(int i=0;i<n;i++){
        int p;
        int check = 1;
        scanf("%d",&p);
        for(int j=2;j*j<=p;j++){
            if(p%j==0){
                check=0;
                break;
            }
        }
        if(check==1){
            count++;
        }
    }
    printf("%d\n",count);
   return 0;
}
