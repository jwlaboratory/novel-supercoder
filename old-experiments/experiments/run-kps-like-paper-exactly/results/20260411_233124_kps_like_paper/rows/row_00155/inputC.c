#include<stdio.h>

int main(void){
    
    int a, b;
    
    scanf("%d", &a);
    scanf("%d", &b);
    
    printf("%d %d %f\n", a / b, a % b, (double)a / (double)b);
    
    return 0;
}
