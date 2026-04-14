```c
#include<stdio.h>
int main(){
  int n,p[100001],i,t;
  scanf("%d",&n);
  for(i=0;i<n;i++){scanf("%d",&t);p[i]=i+1==t;}
  t=0;for(i=0;i<n;i++)if(p[i]){t++;p[i]=p[i+1]=0;}
  printf("%d",t);
}
```