```c
#include<stdio.h>

int main(void)
{
  int n;
  char s[110];
  scanf("%d%s",&n,s);

  int i,j,a,b,ans=0,cnt;
  char c;
  for(i=1;i<n;i++){
    cnt=0;
    for(c='a';c<='z';c++){
      a = 0;  b = 0;
      for(j=0;j<i;j++){
        if(s[j]==c)
          a = 1;
      }
      for(j=i;j<n;j++){
        if(s[j]==c)
          b = 1;
      }
      if((a==1)&&(b==1))
        cnt++;
    }
    if(ans<cnt)
      ans = cnt;
  }

  printf("%d\n",ans);
  return 0;
}```