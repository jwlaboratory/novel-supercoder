#include <stdio.h>

int main(void){
    int age,a,b;
    scanf("%d",&age);
    if(age == 1){
        printf("Hello World");
    }else{
        scanf("%d %d",&a,&b);
        printf("%d",a+b);
    }
    return 0;
}
