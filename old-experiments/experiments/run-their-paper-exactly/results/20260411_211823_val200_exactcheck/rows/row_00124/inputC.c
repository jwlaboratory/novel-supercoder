```c
#include <stdio.h>
#define MAX 100000
long long T[MAX];
int n,k;
 
int load(long long P) {
    int i=0,j=0;
    long long t;
    for(i = 0; i < k; i++) {
        t = 0;
        while( t+T[j] <=P) {
            t +=T[j];
            j++;
            if(j==n) return n;  
        }
    }
    return j;   
     
}
 
int solve() {
    long long right = MAX*10000,left=0,mid,s;
     
    while(right>left+1) {
        mid = (right + left)/2;
         s=load(mid);
         if(s>=n) right=mid;
         else left = mid;
    }
        return right;           
}
 
int main(void)
 
{
    int i;
    scanf("%d %d%",&n,&k);
     
    for(i=0; i < n; i++) {
        scanf("%d",&T[i]);
    }
        printf("%llu\n",solve());
        return 0;       
     
     
}
```