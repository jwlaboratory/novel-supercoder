#include <stdio.h>
int main(void){
    int s, h, m;
    int S; 
    int a;
    
    scanf("%d", &S);
    
     0 <= S < 86400;
    
    a = S / 60  ;
    s = S % 60 ;
    h = a / 60 ;
    m = a % 60  ;
    
    printf("%d:%d:%d\n", h, m, s);
    
    return 0;
}
