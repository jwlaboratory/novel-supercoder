#include <stdio.h>
#define H 255

typedef struct{
  int key;
  int p;
  int l;
  int r;
}Node;

void insert(Node *,int *,int );
void Print(Node *,int );

int main(){
  int n,i,data[H];
  Node heap[H];

  scanf("%d",&n);

  for(i=0;i<n;i++){
    scanf("%d",&data[i]);
    heap[i].p=0;
    heap[i].l=1;
    heap[i].r=1;
  }
  insert(heap,data,n);
  Print(heap,n);

  
  return 0;
}

void insert(Node *heap,int *data,int n){
  int i,x;
  for(i=0;i<n;i++){
    x=i+1;
    heap[i].key=data[i];
    if(x/2>=1){
      heap[i].p=x/2;
    }
    heap[i].l=x*2;
    heap[i].r=x*2+1;
  }
}

void Print(Node *heap,int n){
  int i,x;

  for(i=0;i<n;i++){
  printf("node %d: key = %d, ",i+1,heap[i].key);
  if(heap[i].p!=0&&heap[i].p-1<n){
    x=heap[i].p-1;
    printf("parent key = %d, ",heap[x].key);
  }
  if(heap[i].l-1!=0&&heap[i].l-1<n){
    x=heap[i].l-1;
    printf("left key = %d, ",heap[x].key);
  }
  if(heap[i].r-1!=0&&heap[i].r-1<n){
    x=heap[i].r-1;
    printf("right key = %d, ",heap[x].key);
  }
  printf("\n");
  }
}
      

