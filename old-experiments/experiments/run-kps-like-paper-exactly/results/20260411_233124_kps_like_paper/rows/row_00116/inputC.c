#include<stdio.h>
#include<stdlib.h>
#include<math.h>

typedef long long int int64;

#define MAX(a,b) ((a)>(b)?(a):(b))
#define MIN(a,b) ((a)<(b)?(a):(b))
#define ABS(a) ((a)>(0)?(a):-(a))

void run(void){
  int a,b,c;
  scanf("%d%d%d",&a,&b,&c);
  int d=b/a;
  printf("%d\n",MIN(c,d));
}

int main(void){
  run();
  return 0;
}