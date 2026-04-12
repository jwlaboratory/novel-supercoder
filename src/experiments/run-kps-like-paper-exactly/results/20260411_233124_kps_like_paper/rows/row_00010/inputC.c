#include<stdio.h>

#include<string.h>

int main(void){

int num,i,count,sum;

char number[1001];

char*str;

while(1){

scanf("%s",number);

i=0;

sum=0;

str=&number;

count=(int)strlen(str);

if(number[0]=='0'){

if(count==1){

break;

}

}

while(i<count){

num=number[i]-'0';

sum=sum+num;

i++;

}

printf("%d\n",sum);

}

return 0;

}