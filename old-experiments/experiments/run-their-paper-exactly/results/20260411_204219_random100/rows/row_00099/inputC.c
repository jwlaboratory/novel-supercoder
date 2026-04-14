```c
#include <stdio.h>
int main(){
int H, W, i, j;
for (;;){
scanf("%d %d", &H, &W);
if (H == 0 && W == 0 ) break;
for ( i = 1; i < H+1; i++ ){
for ( j = 1; j < W+1; j++)
putchar('#');
putchar('\n');
}
printf("\n");
}
return 0;
}

```