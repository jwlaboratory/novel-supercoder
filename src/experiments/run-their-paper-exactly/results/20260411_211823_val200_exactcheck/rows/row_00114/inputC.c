```c
#include <stdio.h>
int main(void){
  char ch, C;
  for(;;){
  scanf("%c",&ch);
  if(ch == '\n'){
      break;
  }
  else if(ch == ' '){
      printf(" ");
  }
  else if('A' <= ch && ch <= 'Z'){
      C = ch + 32;
      printf("%c",C);
  }
  else if('a' <= ch && ch <= 'z'){
      C = ch - 32;
      printf("%c",C);
  }
  else{
      printf("%c",ch);
  
  }
  }
  printf("\n");
  return 0;
}
```