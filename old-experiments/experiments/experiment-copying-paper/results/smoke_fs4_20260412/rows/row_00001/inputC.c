```c
#include <stdio.h>
int main(void){
    // Your code here!
    int i,j,n;
    int ans=0,sum=0;
    scanf("%d",&n);
    int a[n];
    
    for(i=0;i<n;i++){
        scanf("%d",&a[i]);
    }
    
    for(j=0;j<n;j++){
        ans = (ans+(long)a[j]*sum)%1000000007;
        sum = (sum+a[j])%1000000007;
    }
    
    printf("%d\n",ans);
    return 0;
}
```