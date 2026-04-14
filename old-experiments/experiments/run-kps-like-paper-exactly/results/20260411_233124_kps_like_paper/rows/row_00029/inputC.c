#include<stdio.h>
#include<string.h>
int main()
{
 char s[100000];
 int i;
 int b1=0;
 int w1=0;
 scanf("%s",s);
 
 for(i=0;i<strlen(s);i++){
     if(i%2==0){
       if(s[i]=='0'){
         b1++; 
       }
     }
   
   else if(i%2==1){
      if(s[i]=='1'){
        b1++;
      }
   }
 }

     

   for(i=0;i<strlen(s);i++){
   if(i%2==0){
     if(s[i]=='1'){
      w1++; 
     }
   }
   else if(i%2==1){
      if(s[i]=='0'){
        w1++;
      }
   }
 }
     
 if(b1<=w1){
   printf("%d",b1);
 }
 else if(b1>w1){
   printf("%d",w1);
 }
   
 
   return 0;
}
    