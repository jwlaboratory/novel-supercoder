#include <stdio.h>
int main(void){
  int a,b,c;
  scanf("%d %d %d",&a,&b,&c);
if(c>=a&&c>=b){printf("%d",c*10+b+a);}
  else if(b>=a&&b>=c){printf("%d",b*10+c+a);}
    else if(a>=b&&a>=c){printf("%d",a*10+c+b);}
  return 0;
}