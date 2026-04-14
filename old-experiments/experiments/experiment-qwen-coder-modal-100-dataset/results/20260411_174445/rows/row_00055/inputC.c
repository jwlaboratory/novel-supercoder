#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
int main(void){
	long long A,B,N,ans,buff1,buff2;
	int i;
	char str[10000000],buf[10000000];
 
	fgets(str, sizeof(str), stdin);
	A=strtoll(strtok(str ," "),buf,10);
	B=strtoll(strtok(NULL," "),buf,10);
	N=strtoll(strtok(NULL," "),buf,10);
  
  	if(N>=(B-1)){
 		buff1=A*(B-1)/B;
		buff2=0;
		buff2*=A;
      	ans=buff1-buff2;
    }else{
 		buff1=A*N/B;
		buff2=N/B;
		buff2*=A;
      	ans=buff1-buff2;
    }

	printf("%ld\n",ans);

	return 0;
}