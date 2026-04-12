#include<stdio.h>
int main()
{
    int k,s,x,y,z,count=0;
    scanf("%d %d",&k,&s);
    for(x=0;x<=k;x++)
    {
        for(y=0;y<=k;y++)
        {
            z=s-x-y;
            if(z<=k && z>=0)
            {
                count++;
            }
        }
    }
    printf("%d\n",count);

    return 0;
}
