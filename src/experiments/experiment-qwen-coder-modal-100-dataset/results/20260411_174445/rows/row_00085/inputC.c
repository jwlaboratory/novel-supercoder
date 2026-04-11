#include<stdio.h>
int main()
{
    char s[3];
    int i,j,t;
    scanf("%s",s);
    for(i=0;i<3;i++)
        for(j=i;j<3;j++)
            if(s[i]>s[j])
        {t=s[i];s[i]=s[j];s[j]=t;}
        if(s[0]=='a'&&s[1]=='b'&&s[2]=='c')
            printf("Yes\n");
        else
            printf("No\n");

    return 0;
}
