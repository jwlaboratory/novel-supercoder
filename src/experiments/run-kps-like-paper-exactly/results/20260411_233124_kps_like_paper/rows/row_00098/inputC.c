#include<stdio.h>
int main()
{    int a,b,c;
       while(scanf("%d %d %d",&a,&b,&c)==3){
               if(a<c && b>c){
                    printf("Yes\n");
               }
             else if(a==b && b==c){
                    printf("Yes\n");
                }
             else{
                       printf("No\n");
              }
          }
           return 0;
    }