```c
#include<stdio.h>
#define MAX 100000

int X[MAX],num;

int partition(int p,int r){
  int y,i,j,m;
  y = X[r];
  i = p-1;
  for(j=p;j<r;j++){
    if(X[j] <= y){
      i++;
      m = X[i];
      X[i] = X[j];
      X[j] = m;
    }
  }
  m= X[i+1];
  X[i + 1] = X[r];
  X[r] =m;
  return i+1;
}

int main(){
  int i,q;

  scanf("%d",&num);
  for(i=0;i<num;i++){
    scanf("%d",&X[i]);
  }

  q= partition(0,num-1);

  for(i=0;i<num;i++){
    if(i){
      printf(" ");
    }
    if(i == q){
      printf("[");
    }
    printf("%d",X[i]);
    if(i==q){
      printf("]");
    }
  }
    printf("\n");

    return 0;
  }
		  

```