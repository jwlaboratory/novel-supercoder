#include<stdio.h>
int main(){
  int i,j,n,s,minj,count=0;
    scanf("%d",&n);
    int A[n];
    for(i=0;i<n;i++) scanf("%d",&A[i]);
    for(i=0;i<n-1;i++){
      minj=i;
     for(j=i;j<n;j++){
      if(A[j]<A[minj])minj=j;
     }
        s = A[i];
          A[i] = A[minj];
          A[minj] = s;
	  if(i!=minj)count++;
      }
    for(i=0;i<n-1;i++) printf("%d ",A[i]);
    printf("%d\n%d\n",A[n-1],count);
    return 0;
}

