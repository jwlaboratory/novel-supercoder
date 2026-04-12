```c
#include <stdio.h>

int main (){
    
    char str[10005];
    scanf("%[^\n]", str);
    int flag = 0;
    for(int i = 0;str[i] != '\0';i++){
    	if(str[i] == ' '){
    		if(str[i-1] != str[i+1]){
    			flag = 1;
    			break;
			}
		}
	}
	flag == 0 ? puts("YES") : puts("NO");
    
    return 0;
}```