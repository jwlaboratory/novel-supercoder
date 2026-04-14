#include  <stdio.h>

int maxdiv(int x, int y){
    if(y == 0){
        return(x);
    }else{
        return(maxdiv(y, x % y));
    }
}

int main(void)
{
    int x, y;
    
    scanf("%d", &x);
    scanf("%d", &y);
    
    printf("%d\n", maxdiv(x, y));
    
    return 0;
}