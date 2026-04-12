#include <stdio.h>
int main (void)
 {
  int a,i;

  for(i=1;i<10;i++)
  {


         for(a=1;a<10;a++)
         {
          printf("%dx%d=%d\n",i,a,a*i);

         }

  }
  return 0;
}