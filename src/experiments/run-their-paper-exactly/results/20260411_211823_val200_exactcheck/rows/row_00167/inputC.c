```c
#include <stdio.h>
int main()
{
    int m,b;
    scanf("%d %d", &m, &b);

    if(m==b)
    {
        printf("Draw");
    }
    else if(m==1)
    {
        printf("Alice");
    }
    else if(b==1)
    {
        printf("Bob");
    }
    else if(m>b)
    {
        printf("Alice");
    }
    else{
        printf("Bob");
    }
    return 0;
}```