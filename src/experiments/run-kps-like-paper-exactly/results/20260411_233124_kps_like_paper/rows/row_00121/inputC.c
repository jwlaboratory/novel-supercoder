#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int main(){
    char org[200000];
    char str[200000];
    long i,j,n,k,len,nflag=0;

    scanf("%s",org);
    len=strlen(org);
    str[0]=org[0];
    str[1]=0;
    k=1;

    for(i=1;i<len;i+=n){
        n=1;
        if(nflag==0){
        for(j=0;j<256;j++){
            if(i+j>=len){
                break;
                }
            if(org[j+i]==str[j]){
               n++;
               nflag++;
               str[j]=org[j+i];
            }else{
                k++;
                str[j]=org[j+i];
                break;
            }
        }
        }else{
            k++;
            str[0]=org[i];
            nflag=0;
        }
        
        str[n]=0;
    }


    printf("%ld\n",k);
    return 0;
}