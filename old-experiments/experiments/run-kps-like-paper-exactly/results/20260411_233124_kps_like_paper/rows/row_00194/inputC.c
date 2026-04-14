

#include <stdio.h>
#include <stdlib.h>
typedef struct{
    int x;
    int y;
}pair;
int main()
{   int n;
    scanf("%d",&n);
    pair a[n];
    for(int i=0;i<n;i++){
        scanf("%d%d",&a[i].x,&a[i].y);
    }
    int frac=1;
    for(int i=1;i<n;i++){
        frac*=i;
    }
    double ans=0;
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            ans+=(sqrt((a[i].x-a[j].x)*(a[i].x-a[j].x)+(a[i].y-a[j].y)*(a[i].y-a[j].y)))*frac;
        }
    }
    printf("%.8lf",ans/(n*frac));
    return 0;
}
