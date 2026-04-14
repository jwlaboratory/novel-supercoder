```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>




int main(void){
int x;
scanf("%d",&x);
//分類
if(x>=2000){printf("1");return 0;}

//総当たり
int a=0,b=0,c=0,d=0,e=0,f=0;
const int TIME=20;
    for(a=0;a<TIME;a++){
        for(b=0;b<TIME;b++){
            for(c=0;c<TIME;c++){
                for(d=0;d<TIME;d++){
                    for(e=0;e<TIME;e++){
                        for(f=0;f<TIME;f++){
                            if(a*100+b*101+c*102+d*103+e*104+f*105==x){printf("1");return 0;}
                        }
                    }
                }
            }
        }
    }

printf("0");
}
```