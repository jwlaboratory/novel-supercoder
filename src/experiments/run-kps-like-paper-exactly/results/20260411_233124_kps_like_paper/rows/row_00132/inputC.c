#include <stdio.h>

    int main(void)
    { 
        int x,a; 
        a=1;
        while(1){
        x=0;
        scanf("%d",&x);
        if(x==0){
           break;
        }
        printf("Case %d: %d\n",a,x);
        a++;
    
        }
	return 0;
    }