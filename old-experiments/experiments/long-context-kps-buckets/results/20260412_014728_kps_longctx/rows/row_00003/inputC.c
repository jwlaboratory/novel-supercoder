#include<stdio.h>
#include<math.h>

int main(){
    int n,k,y;
    double p=0.0,x;
    scanf("%d %d",&n,&k);
    for(int i=1;i<=n;i++){
        x=log2f(k)-log2f(i);
        y=x;
        if(y!=x){
            y+=1;
        }
        if(i<k){
            p+=1.0/(n*powl(2.0,y));
        }
        else{
            p+=((double)n-(double)k+1.0)/(double)n;
            break;
        }
    }
    printf("%.10lf\n",p);
}
