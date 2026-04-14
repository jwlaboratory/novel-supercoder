```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>



int main(void){
int n;
int sum=0;
int low=99999999;
int a[105];
scanf("%d",&n);

for(int i=0;i<n;i++){
    scanf("%d",&a[i]);
}

for(int j=-100;j<=100;j++){
    sum=0;
    for(int k=0;k<n;k++){
        sum=sum+(a[k]-j)*(a[k]-j);
    }
    if(sum<=low){low=sum;}
}
printf("%d\n",low);
}
```