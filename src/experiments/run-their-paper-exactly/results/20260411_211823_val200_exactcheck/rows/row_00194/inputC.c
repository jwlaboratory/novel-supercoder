```c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <limits.h>
#include <time.h>
int main(){
    int i,j,n,k,r,s,p,ans=0;
    char t[100010]={};
    scanf("%d %d %d %d %d %s",&n,&k,&r,&s,&p,t);
    for(i=0; i<k; i++){
        if(t[i]=='r')ans+=p;
        if(t[i]=='s')ans+=r;
        if(t[i]=='p')ans+=s;
    }
    for(i=k; i<n; i++){
        if(t[i]!=t[i-k]){
            if(t[i]=='r')ans+=p;
            if(t[i]=='s')ans+=r;
            if(t[i]=='p')ans+=s;
        }
        else t[i]='m';
    }
    printf("%d",ans);
    return 0;
}```