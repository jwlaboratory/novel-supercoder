#include <stdio.h>
 
int main()
{
    int a, b;
    scanf("%d %d", &a, &b);
    printf("%d %d %.5f\n", a / b, a % b, 1.0 * a / b);
    return 0;
}