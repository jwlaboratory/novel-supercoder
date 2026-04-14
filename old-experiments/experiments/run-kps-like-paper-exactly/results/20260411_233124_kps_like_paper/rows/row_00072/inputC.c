#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <unistd.h>
#include <math.h>
long long int ans=0;
#define  ll long long
//最大公約数
long long int getgcd(long long n, long long m)
{
  int r;
  if (n > m) {
    long long t = m;
    m = n;
    n = t;
  }
  while ((r = m % n) != 0) {
    m = n;
    n = r;
  }
return n;
}

//nの階乗を計算
long long factorial(long long n){
    long long int answer = 1;
while(n > 1){
  answer *= n;
  n--;
}
    return answer;
}

//組み合わせの数nCrを計算
long long calcNumOfCombination(long long  n, long long r){
    return factorial(n) / (factorial(r) * factorial(n-r));
}
 void yes(){
   printf("Yes\n");
 }

 void no(){
   printf("No\n");
 }

int main(int argc, char* argv[]){
	ll a = 0, b = 0,c=0,e=0;
  char h[1000];
	scanf("%s",h);
  if (h[1]=='B') {
    printf("ARC\n" );
  }else{
    printf("ABC\n" );
  }
  return 0;
}
