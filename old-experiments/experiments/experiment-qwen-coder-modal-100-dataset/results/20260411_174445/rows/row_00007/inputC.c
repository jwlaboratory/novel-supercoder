#include<stdio.h>
int X[]={0,1,0,-1};
int Y[]={1,0,-1,0};
int main(){
  int h,w,i,j,d[300][300],y[100010],x[100010],a,b=1e9+1,ny,nx,t,r;
  char s[300][300];
  scanf("%d %d",&h,&w);
  for(i=0;i<h;i++){
    for(j=0;j<w;j++){
      scanf(" %c",&s[i][j]);
      if(s[i][j]=='%')s[y[0]=i][x[0]=j]='#';
      d[i][j]=1e9;
    }
  }
  d[y[0]][x[0]]=t=0;
  for(r=1;r-t;t++){
    for(i=0;i<4;i++){
      ny=y[t]+Y[i];
      nx=x[t]+X[i];
      if(s[ny][nx]=='#'||ny<0||ny>=h||nx<0||nx>=w)continue;
      d[ny][nx]=d[y[t]][x[t]]+1;
      if(s[ny][nx]=='@')a=d[ny][nx];
      if(s[ny][nx]=='$'&&b>d[ny][nx])b=d[ny][nx];
      s[y[r]=ny][x[r]=nx]='#';
      r++;
    }
  }
  //printf("%d %d\n",a,b);
  printf("%s\n",a>=b||a==1e9?"No":"Yes");
  return 0;
}
  