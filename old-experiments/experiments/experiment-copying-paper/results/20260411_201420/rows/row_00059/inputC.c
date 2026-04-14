```c
#include<stdio.h>
int main()
{
    int total,alice,borys;
    scanf("%d %d %d",&total,&alice,&borys);
    if((borys-alice)%2==0)
        printf("Alice");
    else if((borys-alice)%2!=0)
        printf("Borys");
    return 0;
}
```