#include<stdio.h>

int main(void)
{
  int s,w;
  scanf("%d %d", &s ,&w);
  if(!(s >= 1 && s <= 100 && w >= 1 && w <= 100))
    return 1;
  if(w >= s)
  {
    printf("unsafe\n");
  }
  else
    printf("safe\n");
}