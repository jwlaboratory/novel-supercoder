```c
#include <stdio.h>
int main(void){
    int n;
    scanf("%d\n",&n);
    
    int fib[45];
    fib[0]=1;
    fib[1]=1;
    
    for(int i=2;i<=n;i++){
        fib[i]=fib[i-1]+fib[i-2];
    }
    
    printf("%d\n",fib[n]);
    
    return 0;
}

```