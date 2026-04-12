```c
#include<stdio.h>
int main(){
  int n,i,b=0,c=0;
  scanf("%d",&n);
  int a[n+1];
  for(i=0;i<n;i++){
    scanf("%d",&a[i]);
    if(a[i]%2==1)
      b++;
    if(a[i]%4==0)
      c++;
  }
  if((b-1<=c && n%2==1) || (b<=c && n%2==0))
    puts("Yes");
  else
    puts("No");
  return 0;
}
```