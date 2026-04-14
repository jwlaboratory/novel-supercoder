#include<stdio.h>

char s[8]="AGCT";

int main(){
    int i;
    char t[8];
    scanf("%s",t);
    for(i=0;i<4;i++){
        if(t[0]==s[i]){
            printf("%c\n",s[3-i]);
            return 0;
        }
    }
    return 0;
}
