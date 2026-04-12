#include <stdio.h>

int main(){
   int i, x;
   i = 0;
   scanf("%d", &x);
   while(x){
      i = i + 1;
      printf("Case %d: %d\n", i, x);
      scanf("%d", &x);
   }

   return 0;
}

