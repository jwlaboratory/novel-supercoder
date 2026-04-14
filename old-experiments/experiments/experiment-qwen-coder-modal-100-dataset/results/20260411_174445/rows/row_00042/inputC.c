#include <stdio.h>

int main() {
    long long n, x, tmp, ans=0, last=0;
    scanf("%lld %lld", &n, &x);
    for (long i=1; i<=n; i++) {
        scanf(" %lld", &tmp);
        if (last + tmp > x) {
            ans += last + tmp - x;
            tmp = x - last;
        }
        last = tmp;
    }
    printf("%lld\n", ans);
}