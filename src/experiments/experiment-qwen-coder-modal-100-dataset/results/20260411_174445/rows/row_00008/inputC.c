#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

typedef long long int ll;

ll MAX(ll a, ll b){return a>b?a:b;}
ll MIN(ll a, ll b){return a>b?b:a;}
int compare(const void* a, const void* b){return *(int*)a - *(int*)b;}
ll digits(ll a){ll tmp=a; ll cnt=0; while(tmp>0){tmp/=10; cnt+=1;} return cnt;}

int main(void){
    ll n;
    scanf("%lld", &n);
    
    ll ans = (ll)pow(10.0, 12.0);
    int limit_num = sqrt((double)n);

    for(int i=1; i<=limit_num; i++){
        if(n%i == 0){
            ll max = MAX(digits(i), digits(n/i));
            ans = MIN(ans, max);
        }
    }

    printf("%lld\n", ans);
    return 0;
}