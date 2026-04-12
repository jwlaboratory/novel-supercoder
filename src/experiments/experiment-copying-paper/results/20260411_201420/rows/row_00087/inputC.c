```c
#include<stdio.h>
int main(){
int n,m,i;
scanf("%d %d",&n,&m);
for(i=0;i<n;i++)scanf("%*d");
printf("%d\n",(n-2)/(m-1)+1);
return 0;
}```