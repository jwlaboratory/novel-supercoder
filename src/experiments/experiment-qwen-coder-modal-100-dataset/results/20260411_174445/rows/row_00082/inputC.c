#include <stdio.h>

int main(void)
{
  int num[5];
  int tmp;
  int i, j;

  scanf("%d%d%d%d%d", &num[0], &num[1], &num[2], &num[3], &num[4]);

  for(i = 0; i < 4; i++){
    for(j = i + 1; j < 5; j++){
      if(num[i] < num[j]){
	tmp = num[i];
	num[i] = num[j];
	num[j] = tmp;
      }
    }
  }

    for(i = 0; i < 5; i++){
      printf("%d", num[i]);
      if(i == 4)  break;
      putchar(' ');
    }
    printf("\n");

  return 0;
}