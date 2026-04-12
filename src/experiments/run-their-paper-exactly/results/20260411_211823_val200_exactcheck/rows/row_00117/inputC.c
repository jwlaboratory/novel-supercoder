```c
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>
#define Max(a, b) ((a) > (b) ? (a) : (b))
#define Min(a, b) ((a) > (b) ? (b) : (a))
#define Abs(x) ((x) > 0 ? (x) : -(x))
#define REP(i, n) for(int i = 0; i < n; i++)
#define INF 1000000000000 //10^12
#define MOD 1000000007 //10^9 + 7
typedef long long ll;

int
main(int arg, char *argv[])
{
  char s[200000];
  scanf("%s", s);
  int f = 0, l = strlen(s) - 1, cnt = 0, flag = 0;
  while(l - f >= 0){
    if(s[f] == 'x' && s[l] != 'x'){
      f++;
      cnt++;
    }
    else if(s[f] != 'x' && s[l] == 'x'){
      l--;
      cnt++;
    }
    else if(s[l] == s[f]){
      f++;
      l--;
    }
    else{
      printf("-1\n");
      return 0;
    }
  }
  
  printf("%d\n", cnt);

  return 0;
}
 
```