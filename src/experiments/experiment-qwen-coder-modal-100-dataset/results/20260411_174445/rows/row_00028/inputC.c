#include<stdio.h>
#define MAX 2000000
#define MIN -2147483648
void Insert(int *,int,int);
void swap(int *,int *);
void ExtractMax(int *,int);
void maxHeapify(int *,int,int);
int main(){
  char c[10];
  int queue[MAX+1],n,key,count=0,i;
  while(1){
    /*for(i=0;i<count;i++){
      printf("%d\n",queue[i]);
    }
    printf("\n");*/
    scanf("%s",c);
    if(c[2]=='s'){//insert
      scanf("%d",&key);
      Insert(queue,key,count);
      count++;
    }
    else if(c[2]=='t'){//extract
      ExtractMax(queue,count);
      count--;
    }
    else if(c[2]=='d'){//end
      break;
    }
  }
  
  return 0;
}
void Insert(int *A,int key,int count){
  int i=count;
  A[i]=key;
  while(i>0 && A[i/2]<A[i]){
    swap(&A[i],&A[i/2]);
    i=i/2;
  }
}
void swap(int *x,int *y){
  int z;
  z=*x;
  *x=*y;
  *y=z;
}
void ExtractMax(int *A,int n){
  int max=A[0];
  printf("%d\n",max);
  A[0]=A[n-1];
  maxHeapify(A,0,n-1);
}
void maxHeapify(int *A,int i,int H){
  int l,r,largest;
  l = 2*i;
  r = 2*i+1;
  if(l<=H && A[l]>A[H]) largest = l;
  else largest = i;
  if(r<=H && A[r]>A[largest]) largest = r;
  if(largest != i){
    swap(&A[i],&A[largest]);
    maxHeapify(A,largest,H);
  }
}

