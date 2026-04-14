```c
#include <stdio.h>
int main(void){
    // Your code here!
    char str[200001];
    
    scanf("%200000s",str);
    
    for(int i = 0; str[i] != '\0'; i++){
        if(str[i] == '?'){
            str[i] = 'D';
        }
    }
    
    printf("%s\n",str);
}```