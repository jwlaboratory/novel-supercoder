#include<stdio.h>
int main ()
{
    int a,b,i;
    long long int sum=0;
    scanf("%d",&a);
    for (i=1;i<=a;i++)
    {
        if (i%3!=0 && i%5!=0)
        {
           sum=sum+i;
        }
    }
    printf ("%lld\n",sum);
    return 0;
}
