#include<stdio.h>
#define N 100

int main(void){

  int A[N], n, i, j, minj, c=0, x;

  scanf("%d",&n);

  for(i = 0; i < n; i++){
    scanf("%d", &A[i]);
  }

  for(i = 0; i < n; i++){

    minj = i;

    for(j = i; j < n; j++){
      
      if(A[j] < A[minj]){
	
	minj = j;
      }
    }
    if(minj != i) c++;
    x = A[i];
    A[i] = A[minj];
    A[minj] = x;
  }
  
  for(i=0;i<n;i++){
    
    printf("%d",A[i]);
    if(i != n-1) printf(" ");
  }

  printf("\n%d\n",c);
  return 0;
}

