```c
#include <stdio.h>
#include <stdlib.h>

int isodd(int x){
	if(x % 2 == 1){
		return 1;
	}
	return 0;
}

int main(){
	int x, p;
	scanf(" %d %d", &x, &p);
	double y=0, d = (double)x;
	if(isodd(x)){
		d+= 1.0-0.02*p;
		y+=1.0;
	}
	y += d/(0.02*p);
	printf("%lf",y);
}
```