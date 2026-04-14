#include <stdio.h>

int main(){
  int x,y;
  for(x=1;x<=9;x++){
    for(y=1;y<=9;y++){
      printf("%d""x""%d=%d\n",x,y,x*y);
    }
  }
  return 0;
}
