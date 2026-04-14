```c
#include<stdio.h>

void run(void){
  int x,p;
  scanf("%d%d",&x,&p);
  double q=(double)p/100;
  if(x%2==0){
    x/=2;
    printf("%.7f\n",x/q);
  } else {
    double ans=1+q*((x-1)/2/q)+(1-q)*((x+1)/2/q);
    printf("%.7f\n",ans);
  }
}

int main(void){
  run();
  return 0;
}```