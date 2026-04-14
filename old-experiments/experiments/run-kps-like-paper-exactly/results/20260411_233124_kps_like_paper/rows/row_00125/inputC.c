#include <stdio.h>

int main(void)
{
    unsigned long n,a,b;
    scanf("%lu%lu%lu", &n,&a,&b);
    if(a==0){
        printf("0");
        return 0;
    }else if(b==0){
        printf("%lu",n);
        return 0;
    }else if(n>(a+b)){
        unsigned long tmp=n/(a+b);
        unsigned long blue=tmp*a;
        if(n%(a+b)>a){
            blue+=a;
            printf("%lu",blue);
            return 0;
        }else{
            blue+=n%(a+b);
            printf("%lu",blue);
            return 0;
        }
    }else if(n>=a){
        printf("%lu",a);
        return 0;
    }else if(n<a){
        printf("%lu",n);
        return 0;
    }
    return 0;
}