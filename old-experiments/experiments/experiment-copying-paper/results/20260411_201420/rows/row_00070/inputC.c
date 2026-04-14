```c

#include<stdio.h>
int main()
{
    int N,A,i;
    scanf("%d",&N);
    scanf("%d",&A);
    i = N%500;
    if(i == 0)
    {
        printf("Yes\n");
    }
    else if(i <= A)
    {
        printf("Yes\n");
    }
    else
    {
        printf("No\n");
    }
    return 0;
}
```