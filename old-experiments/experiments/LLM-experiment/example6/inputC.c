#include <stdio.h>
#include <math.h>
#define P 3.141592653589

int main(void){
    double r;
    double S,T;
    scanf("%lf",&r);
    
    if(r<=0||10000<=r){
        printf("error\n");
        return 0;
    }
    
    S=P*r*r;
    T=2*P*r;
    
    printf("%lf %lf\n",S,T);
    
    return 0;
}
