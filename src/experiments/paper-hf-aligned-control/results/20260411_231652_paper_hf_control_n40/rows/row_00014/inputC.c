```c
#include<stdio.h>
int main(){
  char s[100010];
  int i,n,a=1;
  scanf("%s",s);
  for(n=0;s[n];n++);
  for(i=0;i<n-1;i++){
    if(s[i]-s[n-i-2])goto END;
  }
  if(s[0]=='0'||s[n-1]=='1')goto END;
  for(i=0;i<n-1;i++){
    printf("%d %d\n",a,i+2);
    if(s[i]=='1')a=i+2;
  }
  return 0;
 END:;
  printf("-1\n");
  return 0;
}
		   
```