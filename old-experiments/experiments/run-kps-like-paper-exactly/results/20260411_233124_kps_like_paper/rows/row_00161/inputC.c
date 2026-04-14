                                                                       #include<stdio.h>

int main(void){
        int a;
        int b;
        int ans;

        scanf("%d%d", &a, &b);

        ans = a - (b * 2);

        if(ans < 0){
                ans = 0;
        }

        printf("%d\n", ans);

        return 0;
}