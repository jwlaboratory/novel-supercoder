#include <stdio.h>
int main(void){
   double x1,y1,x2,y2,x3,y3,xp,yp;
   double xab,yab,xbc,ybc,xca,yca;
   double xap,yap,xbp,ybp,xcp,ycp;
   double z1,z2,z3;
   
   while(scanf("%lf %lf %lf %lf %lf %lf %lf %lf",&x1,&y1,&x2,&y2,&x3,&y3,&xp,&yp)!=EOF){
       xab=x2-x1,yab=y2-y1;
       xap=xp-x1,yap=yp-y1;
       z1=(xab*yap)-(yab*xap);
       
       xbc=x3-x2,ybc=y3-y2;
       xbp=xp-x2,ybp=yp-y2;
       z2=(xbc*ybp)-(ybc*xbp);
       
       xca=x1-x3,yca=y1-y3;
       xcp=xp-x3,ycp=yp-y3;
       z3=(xca*ycp)-(yca*xcp);
       
       if((z1<0&&z2<0&&z3<0) || (z1>0&&z2>0&&z3>0)){
           printf("YES\n");
       }else{
           printf("NO\n");
       }
   }
   
   return 0;
    
}

