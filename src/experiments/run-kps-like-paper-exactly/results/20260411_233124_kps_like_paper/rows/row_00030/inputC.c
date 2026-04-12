#include <stdio.h>
#include <string.h>
int main(void) {

    int n,i,S[13],H[13],C[13],D[13],num;
    char s[100];
    scanf("%d", &n);
    for(i=0;i<n;i++){
        scanf("%s %d",&s,&num);
        if(strcmp("S",s)==0){
            S[num] = num;
        }
        if(strcmp("H",s)==0){
            H[num] = num;
        }
        if(strcmp("C",s)==0){
            C[num] = num;
        }
        if(strcmp("D",s)==0){
            D[num] = num;
        }
    }
    for(i=1;i<14;i++){
        if(S[i]!=i){
            printf("S %d\n",i);
        }
    }
    for(i=1;i<14;i++){
        if(H[i]!=i){
            printf("H %d\n",i);
        }
    }
    for(i=1;i<14;i++){
        if(C[i]!=i){
            printf("C %d\n",i);
        }
    }
    for(i=1;i<14;i++){
        if(D[i]!=i){
            printf("D %d\n",i);
        }
    }
    return 0;
}