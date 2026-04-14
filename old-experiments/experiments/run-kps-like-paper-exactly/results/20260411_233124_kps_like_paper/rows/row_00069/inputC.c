#include <stdio.h>
#define INFTY 2000000001
#define MAX 500000
int count=0;
int L[MAX/2+2],R[MAX/2+2];

void merge(int A[],int left,int mid,int right)
{
  int i,j,k,n1,n2;

  n1=mid-left;
  n2=right-mid;
  for(i=0;i<n1;i++){
    L[i]=A[left+i];
  }
  for(i=0;i<n2;i++){
    R[i]=A[mid+i];
  }
  L[n1]=INFTY;
  R[n2]=INFTY;
  i=0;
  j=0;
  for(k=left;k<right;k++){
    count++;
    if(L[i]<=R[j]){
      A[k]=L[i++];
    
    }else{
      A[k]=R[j++];
    
    }
  }
}

void mergeSort(int A[],int left,int right)
{
  int mid;
  if(left+1<right){
    mid=(left+right)/2;
    mergeSort(A,left,mid);
    mergeSort(A,mid,right);
    merge(A,left,mid,right);
  }
}

int main(){
int i,n,s[MAX];

  scanf("%d",&n);
  for(i=0;i<n;i++){
    scanf("%d",&s[i]);
  }
  mergeSort(s,0,n);
  for(i=0;i<n;i++){
    if(i>0) printf(" ");
    printf("%d",s[i]);
  }
  printf("\n");
  printf("%d\n",count);

  return 0;
}
