#include <stdio.h>
 
int main(void) {
    unsigned long long n;
    unsigned long long num;
    unsigned long long i;
    unsigned long long sum;
    scanf("%lld",&n);
    sum=0;
    for(i=0;i<n;i++) {
        scanf("%lld",&num);
        sum+=num;
    }
    printf("%lld\n",sum/n);
    return 0;
}