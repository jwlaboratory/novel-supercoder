#include <stdio.h>
int main(){
  int a,i,n;
  int L[7];
  while (1){
    scanf("%d",&n);
    if (n==0)break;
    for (i=0;i<7;i++)
        L[i]=0;
    for (i=0;i<n;i++){
      scanf("%d",&a);
      if (a>60) a=60;
      L[a/10]++;
    }
    for (i=0;i<7;i++)
      printf("%d\n",L[i]);

  }
  return 0;
}