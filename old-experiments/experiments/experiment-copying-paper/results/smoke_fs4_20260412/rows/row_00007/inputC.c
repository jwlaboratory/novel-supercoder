```c
#pragma GCC optimize ("O3")
#pragma GCC target ("avx2")

#include <stdio.h>
#include <stdlib.h>

int get_int() {
    int res = 0;
    char c = getchar();
    while(c != '\n') {
        res *= 10;
        res += c - '0';
        c = getchar();
    }
    return res;
}


void put_int(int n) {
    char c[30];
    int sz = 0;
    c[sz++] = (n % 10) + '0';
    n /= 10;
    while(n > 0) {
        c[sz++] = (n % 10) + '0';
        n /= 10;
    }
    for(int i = sz-1; i >= 0; i--) {
        putchar(c[i]);
    }
    putchar('\n');
}

int main(){
    int n = get_int();
    int ans = 8 - (n - 400) / 200;
    put_int(ans);
    return 0;
}
```