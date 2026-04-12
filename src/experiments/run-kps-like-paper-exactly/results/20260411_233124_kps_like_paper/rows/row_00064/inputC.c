#include<stdio.h>
#include<string.h>
int main(){
    char a[15],b[15],c[15];
    scanf("%s %s %s",a,b,c);
    getchar();
    if(a[strlen(a)-1]==b[0] && b[strlen(b)-1]==c[0]) puts("YES");
    else puts("NO");
    return 0;
}
