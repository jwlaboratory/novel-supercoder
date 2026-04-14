#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <limits.h>
#include <string.h>

int main()
{
   char S[100001]={'\0'};
   scanf("%s",S);
   int count=0;
   for (int i =0;i<strlen(S)-1;i++)
   {
    if (S[i]==S[i+1])
    {
        count++;
        if (S[i+1]=='0')S[i+1]='1';
        else S[i+1]='0';

    }

   }

   printf("%d",count);
    return 0;
}
