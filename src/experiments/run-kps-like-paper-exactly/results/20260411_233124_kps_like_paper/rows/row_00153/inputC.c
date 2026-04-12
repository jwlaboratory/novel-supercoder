#include<stdio.h>
#include<stdlib.h>

int main(){
  int n,q;
  int *S,*T,B[100];
  int count=0,i,j,u;
  int flag=0;
  
  scanf("%d",&n);
  S=(int *)malloc(n*sizeof(int));
  for(i=0;i<n;i++) scanf("%d",&S[i]);
  scanf("%d",&q);
  T=(int *)malloc(q*sizeof(int));
  for(i=0;i<q;i++) scanf("%d",&T[i]);
  
  for(i=0;i<n;i++){
    flag=0;
    for(j=0;j<q;j++){     
      if(S[i]==T[j]){
	for(u=0;u<count;u++){
	  if(B[u]==T[j]) flag=1;
	}
	if(flag==1) break;
	B[count++]=T[j];
	break;
      }
    }
  }
  printf("%d\n",count);

  free(S);
  free(T);
  
  return 0;
}



