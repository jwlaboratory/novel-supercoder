```c
#include<stdio.h>

int main()
{
    int a,b,y,temp;
    double x;
    scanf("%d %d", &a,&b);
    if(b>a)
    {
        temp = a;
        a = b;
        b = temp;
    }
    x=(double)((a-b)/2.00);
    y=((a-b)/2);
    if((x-(double)y)==0)
        printf("%d", a-y);
    else
        printf("IMPOSSIBLE");
    return 0;
}
```