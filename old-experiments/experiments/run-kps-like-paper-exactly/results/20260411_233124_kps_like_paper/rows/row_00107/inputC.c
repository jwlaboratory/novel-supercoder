#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define N 100

main(){
  int y[N],i ,x ;
  char s[N];
  
  while( scanf("%s", s) != EOF ){
    
    if ( s[0] == '+' ){
      y[i-2] = y[i-2] + y[i-1];
      i--;
    }
    
    else if ( s[0] == '-' ){
      y[i-2] = y[i-2] - y[i-1];
      i--;
    }
    
    else if ( s[0] == '*' ){
      y[i-2] = y[i-2] * y[i-1];
      i--;
    }
    
    else {
      x = atoi(s);
      y[i] = x;
      i++;
    } 
    
  }
  
  printf("%d\n",y[i-1]);
  return 0;
  
}