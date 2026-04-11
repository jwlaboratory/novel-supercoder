#include "stdio.h"

int main(){

  int T_alice,T_bob,R_alice,R_bob;

  scanf("%d%d%d%d",&T_alice,&T_bob,&R_alice,&R_bob);

  if (R_alice==-1||R_bob==-1)
    if (T_alice>T_bob)
      printf("Bob\n");
    else if (T_alice<T_bob)
      printf("Alice\n");
    else
      printf("Draw\n");
  else if (R_alice > R_bob)
    printf("Alice\n");
  else if (R_alice <R_bob)
    printf("Bob\n");
  else
    printf("Draw\n");

  return 0;
}

