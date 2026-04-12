```c
#include <stdio.h>
#include <string.h>
int main(void){
  int n,a,gs,ok;
  scanf("%d",&n);
  gs=ok=0;
  for(int i=0;i<n;i++){
    scanf("%d",&a);
    if(a%2==0){          //goosoo
    gs++;
     if(a%3==0||a%5==0){
       ok++;
     }
    }
  }
  if(gs==ok){
    printf("APPROVED");
  }else{
    printf("DENIED");
  }
  return 0;
}```