```c
#include <stdio.h>
#include <string.h>

enum state {Await,Accum};
typedef enum state State;

int main(){

    char x[200001];
    scanf("%s", x);

    int res = 0;
    size_t state = 0;
    for (int i = 0; x[i] != '\0'; ++i) {
        if (x[i] == 'S') {
            ++state;
        } else if (state > 0) {
            --state;
            ++res;
        }
    }


    printf("%lu\n", strlen(x)-2*res);
}```