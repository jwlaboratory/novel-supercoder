```c
#include <stdio.h>
#include <string.h>
int main(void){
    char x[50];
    scanf("%s",x);
    if(x[0]==x[strlen(x)-1]){
        printf("%c\n",x[0]);
    }else{
        printf("o\n");
    }
    return 0;
}```