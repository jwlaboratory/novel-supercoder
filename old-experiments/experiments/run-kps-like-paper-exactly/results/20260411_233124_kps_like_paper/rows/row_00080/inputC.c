#include <stdio.h>
#define N 1000000


int A[N];
int count=0;

/* Merge */
void Merge(int A[],int l,int m,int r){
    int n1,n2;
    int i,j,k;
    int L[N],R[N];
    
    n1=m-l;
    n2=r-m;
    
    for(i=0;i<n1;i++)L[i]=A[l+i];
    for(j=0;j<n2;j++)R[j]=A[m+j];
    
    L[n1] = 2147483647;
    R[n2] = 2147483647;
    
    i=0;
    j=0;
    
    for(k=l;k<r;k++){
        if(L[i]<=R[j]){
            A[k]=L[i];
            count++;
            i++;
        }else{
            A[k]=R[j];
            count++;
            j++;
        }
    }
    
}

/* Merge Sort */
void Merge_Sort(int A[],int left,int right){
    int mid;
    if(left+1<right){
        mid = (left + right)/2;
        Merge_Sort(A,left,mid);
        Merge_Sort(A,mid,right);
        Merge(A,left,mid,right);
    }
}// End Merge-Sort







int main(int argc , char *argv[]){
    int n,i;
    
    
 /* INCERT　SERIES */
    scanf("%d",&n);
    for(i=0;i<n;i++){
        scanf("%d",&A[i]);
    }
    
 /* -------------- */
    
 /* INCERT FUNCTION */
    
    
    Merge_Sort(A,0,n);
    
 /* -------------- */
    
    
   for(i=0;i<n-1;i++){
        printf("%d ",A[i]);
    }
    printf("%d\n",A[n-1]);
    printf("%d\n",count);
    return 0;
    
}