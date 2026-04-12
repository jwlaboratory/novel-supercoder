#include <stdio.h>
int main(void){

  int x,y;
  for(;;){
  scanf("%d %d", &x, &y);
    if(x == 0 && y == 0)break;
    int tmp;
    if(x > y){
    tmp = x;
    x = y;
    y = tmp;
    }
  printf("%d %d\n", x, y);
  }
  return 0;
}