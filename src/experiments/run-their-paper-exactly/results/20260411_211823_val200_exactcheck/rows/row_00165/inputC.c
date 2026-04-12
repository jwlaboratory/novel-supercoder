```c
#include <stdio.h>
#include <string.h>
#include <ctype.h>
int main(){
    int i;
    int cnt=0;
    char t1[1510];
    char t2[1510];
    
    scanf("%s",t1);
    for(i=0;i<strlen(t1);i++){
        t1[i]=tolower(t1[i]);
    }
    while(scanf("%s",t2)){
        if(strcmp(t2,"END_OF_TEXT")==0) break;
        for(i=0;i<strlen(t2);i++){
            t2[i]=tolower(t2[i]);
        }
        if(strcmp(t1,t2)==0) cnt++;
    }
    
    printf("%d\n",cnt);
    
    return 0;
}
```