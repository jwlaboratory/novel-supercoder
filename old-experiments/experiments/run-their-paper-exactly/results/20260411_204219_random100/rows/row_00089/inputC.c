```c
#include <stdio.h>
#define max(p,q)((p)>(q)?(p):(q))

int main(){
	int x,a,b,n;
	scanf("%d%d%d%d",&x,&a,&b,&n);
	while(n--){
		char s[10];
		scanf(" %s",s);
		if(s[0]=='n')x+=a;
		if(s[0]=='t')x+=b;
		if(s[0]=='k')x=0;
		x=max(x,0);
	}
	printf("%d\n",x);
}
```