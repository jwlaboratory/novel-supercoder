#include <stdio.h>
#include <math.h>
#define MAX 500000 
int N,L[MAX],R[MAX],A[MAX],count=0,i;

void merge(int A[],int left,int mid,int right){
  int n1,n2,j,k;
  n1 = mid - left;
  n2 = right - mid;
  for( i = 0 ;i<n1;i++){
    L[i] = A[left + i];
      }
  for (i = 0 ;i<n2;i++){
    R[i] = A[mid + i];
      }
  L[n1] = INFINITY;
  R[n2] = INFINITY;
  i = 0;
  j = 0;
  for (k = left ;k< right;k++){
    if (L[i] <= R[j]){
      A[k] = L[i];
      i = i + 1;
      count++;
    }
    else{ 
      A[k] = R[j];
      j = j + 1;
      count++;
    }
  }
}
void mergeSort(int A[],int left,int right){
  int mid;
  if (left+1 < right){
    mid = (left + right)/2;
    mergeSort(A, left, mid);
    mergeSort(A, mid, right);
    merge(A, left, mid, right);
      }
}
int main(){
      scanf("%d",&N);
      for(i=0;i<N;i++){
	scanf("%d",&A[i]);
      }
      mergeSort(A,0,N);
      for(i=0;i<N;i++){
	if(i!=0)printf(" ");
	printf("%d",A[i]);
      }
      printf("\n");
      printf("%d\n",count);
        return 0;
    }

