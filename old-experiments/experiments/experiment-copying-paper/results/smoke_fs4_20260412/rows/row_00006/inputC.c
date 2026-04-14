```c
#include<stdio.h>
int gcd(int a,int b){return a<b?gcd(b,a):b?gcd(b,a%b):a;}
int lcm(int a,int b){return a*(b/gcd(a,b));}
int main(){
  int a,b,c=1;
  scanf("%d",&a);
  while(a--){
    scanf("%d",&b);
    c=lcm(b,c);
  }
  printf("%d\n",c);
  return 0;
}```