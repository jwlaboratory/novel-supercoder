#include <stdio.h>
int main(void){
    int a, b, c;
    int sum_1 = 0; 
    int sum_2 = 0;

    scanf("%d %d %d", &a, &b, &c);

    sum_1 = a - b;
    sum_2 = c - sum_1;


    if (sum_2 > 0)
    {
        printf ("%d\n", sum_2);
    }

    else
    {
        printf ("%d\n", 0);
    }
    
  
    return 0;
    
}