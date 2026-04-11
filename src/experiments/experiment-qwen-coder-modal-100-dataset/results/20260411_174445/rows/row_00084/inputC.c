#include<stdio.h>
int main(){
  int a,c=0,p=0,i,n,m,b[100010]={};
  char s[3];
  scanf("%d %d",&n,&m);
  for(i=0;i<m;i++){
    scanf("%d %s",&a,s);
    if(b[a]<0)continue;
    if(s[0]=='W')b[a]++;
    else{
      p+=b[a];
      b[a]=-1;
      c++;
    }
  }
  printf("%d %d\n",c,p);
  return 0;
}
