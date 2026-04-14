#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

int main() {

    int n, k,h;
    scanf("%d %d", &n,&k);

    int cnt=0;
    
    for(int i=0;i<n;i++){
        scanf("%d",&h);
        if(h>=k){
            cnt++;
        }
    }
    printf("%d",cnt);

    return 0;

}