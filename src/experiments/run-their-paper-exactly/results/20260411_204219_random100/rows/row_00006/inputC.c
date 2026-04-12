```c
#include <stdio.h>
#include <strings.h>
int main() {
    int a,b;
    char s[15],t[15],u[15];
    scanf("%s %s", &s, &t);
    scanf("%d %d", &a, &b);
    scanf("%s", &u);
    if(strcmp(s,u) == 0) {
        --a;
    } else if(strcmp(t,u) == 0) {
        --b;
    }
    printf("%d %d\n", a, b);
    return 0;
}```