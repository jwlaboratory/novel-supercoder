#include<stdio.h>

int main(){
        int r, g, b, n, ans=0;
        scanf("%d %d %d %d", &r, &g, &b, &n);
        for(int i=0; r*i<=n; i++){
                for(int j=0; r*i+g*j<=n; j++){
                        if((n-r*i-g*j)%b==0) ans++;
                }
        }
        printf("%d\n", ans);
        return 0;
}