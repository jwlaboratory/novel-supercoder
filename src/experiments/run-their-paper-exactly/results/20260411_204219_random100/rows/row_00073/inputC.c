```c
#include<stdio.h>

int main(void)
{
    int x[60], y[60];
    int n;
    int cnt = 0;
    int i;
    double ans;

    while(1){
        scanf("%d", &n);
        if(n == 0) break;
        for(i = 0; i < n; i++)
            scanf("%d %d", &x[i], &y[i]);

        x[n] = x[0]; y[n] = y[0];
        ans = 0;
        for(i = 0; i < n; i++)
            ans += (x[i+1] - x[i]) * (y[i+1] + y[i]);

        cnt++;
        printf("%d %.1lf\n", cnt, ans/2);
    }
    return 0;
}


```