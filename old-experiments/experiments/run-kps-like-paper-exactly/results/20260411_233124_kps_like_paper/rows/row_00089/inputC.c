#include <stdio.h>

int main(){
  int n;  scanf("%d", &n);

  int turn = 1;
  int ans[400010] = {0}, start = 200005, end = 200005;

  for(int i=1; i<=n; i++){
    int a; scanf("%d", &a);
    if(turn == 1)
      ans[end++] = a;
    else
      ans[--start] = a;
    turn *= (-1);
  }
  
  if(turn < 0)
    for(int i=end-1; i>=start; i--)
      printf("%d ", ans[i]);
  else
    for(int i=start; i<end; i++)
      printf("%d ", ans[i]);
  puts("");

  return 0;
}
