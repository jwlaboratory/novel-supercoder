#include <stdio.h>

int main(void)
{
    int a,b,c;
    scanf("%d %d %d",&a,&b,&c);
    if(a==c&&b!=c&&a!=b) {
        printf("Yes");
    }
    else if(a==b&&b!=c&&a!=c) {
        printf("Yes");
    }
    else if(b==c&&a!=b&&a!=c) {
        printf("Yes");
    }
    else if(a!=b&&b!=c&&c!=a) { 
        printf("No");
    }
    else if(a==b&&b==c&&c==a) {
        printf("No");
    }
    return 0;
}