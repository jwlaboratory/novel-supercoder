#include <stdio.h>
int main(void){
    int N, ame=0;
    scanf("%d", &N);
    for(int i=1;i<=N; i++) ame+=i;
    printf("%d", ame);
    return 0;
}