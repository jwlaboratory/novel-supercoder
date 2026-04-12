#include<stdio.h>

int main(){
	int dansu=1;
	int cnt=1;
	
	for(;dansu<10;dansu++){
		for(cnt=1;cnt<10;cnt++){
			printf("%dx%d=%d\n",dansu,cnt,dansu*cnt);
		}
	}
    return 0;
}