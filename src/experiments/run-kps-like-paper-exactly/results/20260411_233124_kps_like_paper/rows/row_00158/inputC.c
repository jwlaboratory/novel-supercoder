
#include <stdio.h>
#define swap(a, b) ((a != b) && (a += b, b = a - b, a -= b))

int main(void)
{
  int a, b;
  char op;

  while (scanf("%d %c %d", &a, &op, &b), op != '?') {
    switch (op) {
      case '+':
        printf("%d\n", a+b);
        break;
      case '-':
        printf("%d\n", a-b);
        break;
      case '*':
        printf("%d\n", a*b);
        break;
      case '/':
        printf("%d\n", a/b);
        break;
      case '?':
        return 0;
    }
  }

  return 0;
}