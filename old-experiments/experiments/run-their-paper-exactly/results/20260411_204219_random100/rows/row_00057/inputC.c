```c
#include <stdio.h>
int main()
{
    int num,temp,rem,count=0;
    scanf("%d",&num);
    temp = num;
    while(temp!=0)
    {
        rem = temp%10;
        if(rem==2)
            count++;
        temp/=10;
    }
    printf("%d\n",count);
    return 0;
}
```