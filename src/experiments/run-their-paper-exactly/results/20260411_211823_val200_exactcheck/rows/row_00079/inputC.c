```c
#include<stdio.h>

int main(){
  int N,ans=0;
  scanf("%d",&N);
  int a[N];
  for (int i = 0; i<N; i++){
    scanf("%d",&a[i]);
  }

  for (int i = 0; i<N; i++){
    if (a[a[i]-1]==i+1){
      ans++;
    }
  }
  printf("%d",ans/2);

  return 0;

}```