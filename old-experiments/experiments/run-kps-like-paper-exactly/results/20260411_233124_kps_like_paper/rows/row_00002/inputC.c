#include<stdio.h>

int main(){
    int n, m, i, j, f;
    scanf("%d %d", &n, &m);
    int s[m], c[m];
    for(i=0;i<m;i++){
        s[i]=0; c[i]=0;
        scanf("%d %d",&s[i], &c[i]);
    }
    for(i=0;i<m-1;i++){
        for(j=i+1;j<m;j++){
            if(s[i]==s[j]&&c[i]!=c[j]){ printf("-1"); return 0; }
        }
    }
    for(i=1;i<=n;i++){
        f=0;
        for(j=0;j<m;j++){
            if(s[j]==1&&c[j]==0&&n>1){ printf("-1"); return 0; }
            else if(i==s[j]){ printf("%d",c[j]); f=1; break; }
        }
        if(f==0&&i==1&&n>1){ printf("1"); }
        else if(f==0){ printf("0"); }
    }
}