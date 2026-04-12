// C - Slimes
#include <stdio.h>
#include <string.h>

int main(void){
    int i, j, n, cnt=0;
    char s[100010], c;
    scanf("%d%s", &n, s);
    for(i=0; i<n; i++){
        if(s[i]!=s[i+1]){cnt++;}
    }
    printf("%d\n", cnt);
    return 0;
}