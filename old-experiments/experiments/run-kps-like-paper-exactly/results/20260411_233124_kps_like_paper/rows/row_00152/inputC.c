 #include <stdio.h>
 
 int main(){
     int a,b,c;

     scanf("%d",&a);
     scanf("%d",&b);
     scanf("%d",&c);

     if(a < b && b < c)
         puts("Yes");
     else
         puts("No");

return 0;
}