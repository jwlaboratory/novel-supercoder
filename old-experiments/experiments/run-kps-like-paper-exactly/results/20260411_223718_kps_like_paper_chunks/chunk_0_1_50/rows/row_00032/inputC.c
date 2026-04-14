#include <stdio.h>
#include <math.h>

int main(){
    int a,b;
    for(a=1;a<=9;a+=1){
        for(b=1;b<=9;b+=1){
             printf("%dx%d=%d\n",a,b,a*b);
        }
    }
    return 0;
}