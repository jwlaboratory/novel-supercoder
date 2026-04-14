#include<stdio.h>
#include<string.h>
int main(void){
  int a, b, c;
  char x[10000];
  while(1){
    scanf("%d %c %d", &a, x, &b);
    if(!strcmp(x, "?")){
      break;
    }
    if(!strcmp(x, "+")){
      c = a + b;
    }
    if(!strcmp(x, "-")){
      c = a - b;
    }
    if(!strcmp(x, "/")){
      c = a / b;
    }
    if(!strcmp(x, "*")){
      c = a * b;
    }
    printf("%d\n", c);
  }
  return 0;
}
