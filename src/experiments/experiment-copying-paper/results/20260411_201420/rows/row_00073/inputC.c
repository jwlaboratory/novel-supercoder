```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#define rep(i,n) for(int i=0; i<(int)(n); i++)

int main(){
    int c[5][5];
    rep(i,3) rep(j,3) scanf("%d",&c[i][j]);
    int sum = 0, tmp;
    rep(i,3) rep(j,3) sum += c[i][j];
    int ok = 1;
    if(sum%3 != 0) ok = 0;
    sum /= 3;
    rep(i,3){
        tmp = c[0][i]+c[1][(i+1)%3]+c[2][(i+2)%3];
        if(sum!=tmp) ok=0;
    }
    rep(i,3){
        tmp = c[0][2-i]+c[1][(2-i-1+3)%3]+c[2][(2-i-2+3)%3];
        if(sum!=tmp) ok=0;
    }
    
    if(ok) puts("Yes");
    else puts("No");
}```