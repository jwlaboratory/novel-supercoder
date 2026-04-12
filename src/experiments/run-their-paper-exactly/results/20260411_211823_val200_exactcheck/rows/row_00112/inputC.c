```c
#include<stdio.h>

int main(void){
  int n , k;
  scanf("%d %d",&n ,&k);

  int check[10] = {0} , a;
  for(int i = 0;i < k;i ++){
    scanf("%d",&a);
    check[a] ++;
  }

  int ans , flag = 0;
  for(int i = n;i < 1000000;i ++){
    int temp = i , b;
    while(temp > 0){
      b = temp%10;
      if(check[b] != 0){
        temp = 0;
        flag = 1;
      }
      temp /= 10;
    }
    if(flag == 0){
      ans = i;
      i += 10000000;
    }
    flag = 0;
  }


  printf("%d\n",ans);

  return 0;
}```