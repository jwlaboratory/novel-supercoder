#include<stdio.h>
int MAX(int a,int b){return a<b?b:a;}
int main(){
  int n,m,a,b,c,i,j,o[400],d[1010]={1};
  scanf("%d",&n);
  while(n--){
    scanf("%d %d %d",&a,&b,&c);
    for(i=0;i<400;i++){
      if(d[i]==0)continue;
      for(j=a;j<=b;j++)d[i+j]=MAX(d[i+j],d[i]+c);
    }
  }
  //for(i=0;i<20;i++)printf("%d %d\n",i,d[i]);
  scanf("%d",&n);
  for(i=0;i<n;i++){
    scanf("%d",&a);
    o[i]=d[a]-1;
    if(d[a]==0)o[0]=-1;
  }
  if(o[0]<0)printf("-1\n");
  else{
    for(i=0;i<n;i++)printf("%d\n",o[i]);
  }
  return 0;
}