```c
#include<stdio.h>
#include<stdlib.h>
int fun(int [],int );
int cmp(const void *,const void *);
int cmp(const void *a,const void *b)
{
    return *(int *)a-*(int *)b;
}
int fun(int a[],int n)
{
    int i,sum=0;
    qsort(a,2*n,sizeof(a[i]),cmp);
    for(i=0;i<2*n;i++)
    {
        if(i%2==0)
        {
            sum=sum+a[i];
        }
    }
    return sum;
}
int main()
{
    int a[201];
    int n,i;
    scanf("%d",&n);
    for(i=0;i<2*n;i++)
    {
        scanf("%d",&a[i]);
    }
    printf("%d\n",fun(a,n));
    return 0;
}```