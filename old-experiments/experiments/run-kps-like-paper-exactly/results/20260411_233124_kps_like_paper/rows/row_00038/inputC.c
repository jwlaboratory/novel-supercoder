#include <stdio.h>
#include<stdlib.h>
#include<string.h>
#include <assert.h>

int main(void){
		long long int a,b = 100,c = 0;
    //int ans;
		scanf("%lld",&a);

    while(1){
    b = b*1.01;
    c++;
    if(b >= a){
      break;
    }
  }
  printf("%lld\n",c);


		return 0;
}
