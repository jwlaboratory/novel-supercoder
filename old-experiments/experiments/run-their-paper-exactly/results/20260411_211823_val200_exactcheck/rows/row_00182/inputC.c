```c
#include <stdio.h>

int main()
{
    int m,d,i,j,count = 0,d1,d10;

    scanf("%d %d",&m,&d);

    for (i = 1; i <= d; i++)
    {
        d10 = i / 10;
        d1 = i % 10;
        if((d10 >= 2) && (d1 >= 2))
        {
            if(d10 * d1 <= m)
            {
                //printf("%d %d %d",d1,d10,d1 * d1);
                count++;
            }
        }
    }
    
    
    printf("%d",count);
}```