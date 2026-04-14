/*
AizuOnline A0031
Weight
*/
#include <stdio.h>


main()
{
  int weight;
  int fundou;
  int flag;
  
  while(EOF !=scanf("%d",&weight))
    {
      flag = 0;
      for(fundou=1;fundou <= 512;fundou <<= 1)
      { if(weight & fundou)
        {
          if(flag)
            printf(" ");
          printf("%d",fundou);
          flag = 1;
        }
      }
        printf("\n");
    }

return(0);
}