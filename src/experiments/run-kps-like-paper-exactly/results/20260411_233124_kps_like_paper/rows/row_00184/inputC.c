#include <stdio.h>
int serch(int);
int A[1000000],kazu;
int main()
{
int i,j,suji,sum=0;
scanf("%d",&kazu);
for(i=0;i<kazu;i++){
  scanf("%d",&A[i]);
}
scanf("%d",&suji);
for(i=0;i<suji;i++){
  scanf("%d",&j);
  if(serch(j)) sum++;
}
  printf("%d\n",sum);
  return 0;
}
 int serch(key){
int left=0;
int right=kazu;
int mid; 

while(left<right){
  mid=(left+right)/2;
if(key==A[mid])
  return 1;
if(key<A[mid])
  right=mid;
else if(key>A[mid])
  left=mid+1;
}
  return 0;

}

