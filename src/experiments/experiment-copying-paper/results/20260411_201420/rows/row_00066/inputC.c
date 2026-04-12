```c
#include<stdio.h>
 int main()
{
 int h,w,i,j;
 
 for(;;){
         scanf("%d%d",&h,&w);
         if(h+w==0)break;

         for(i=1;i<=h;i++){
                          for(j=1;j<=w;j++)
                          if((i+j)%2==0)
                                 printf("#");
                          else
                                 printf(".");
                          printf("\n");
                          }
         printf("\n");
         }
 return 0;
}
         
```