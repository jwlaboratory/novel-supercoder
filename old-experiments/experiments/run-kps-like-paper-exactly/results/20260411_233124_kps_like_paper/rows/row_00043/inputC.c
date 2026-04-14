#include <stdio.h>

int main(void)
{
  int n,m,k,s;

  scanf("%d %d", &n, &m);
  s = m;
  int max = s;
  int i[10000][2] = {};

  for(k = 0; k < n; k++)
    {
      scanf("%d %d", &i[k][0], &i[k][1]);

      s += i[k][0];
      s -= i[k][1];

      if ( s < 0 ) {
	max = 0;
	break;
      }
      
      if ( max < s)
	max = s;
    }

  printf("%d\n", max);

  return 0;

}