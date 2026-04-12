#include<stdio.h>
int main(){
    int a,b,c;
    char x='x',y='=';
    for(a=1;a<=9;a++){
        for(b=1;b<=9;b++){
            c=a*b;
            printf("%d%c%d%c%d\n",a,x,b,y,c);
        }
    }

    return 0;
}