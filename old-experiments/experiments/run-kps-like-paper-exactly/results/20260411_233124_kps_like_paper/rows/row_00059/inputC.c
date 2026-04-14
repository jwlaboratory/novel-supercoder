#include <stdio.h>
#include <string.h>

int main(void){
    
    char s[100001];
    scanf("%s",s);
    int l=strlen(s);
    int a[l];
    int c1 = 0, c2 = 0;

    int i;

    for(i = 0; i < l;i++){
        if(i%2==0){
            if(s[i]=='0')   c1++;
        }
        else{
            if(s[i]=='1')   c1++;
        }
    }

    for(i = 0; i < l;i++){
        if(i%2==0){
            if(s[i]=='1')   c2++;
        }
        else{
            if(s[i]=='0')   c2++;
        }
    }

    int ans=0;
    if(c1 <= c2){
        ans = c1;
    }
    else{
        ans = c2;
    }

    printf("%d",ans);

    return 0;

}