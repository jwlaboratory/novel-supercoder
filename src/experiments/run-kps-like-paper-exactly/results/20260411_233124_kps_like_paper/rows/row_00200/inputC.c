#include<stdio.h>
int main(void){
  int a,b;
  double c;
    scanf("%d %d",&a,&b);
    c=(double)(a)/(double)(b);
    printf("%d %d %f\n",a/b,a%b,c);
  return 0;
}
