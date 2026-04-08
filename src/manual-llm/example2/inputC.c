#include <stdio.h>
#include <stdlib.h>

int main()
{

    int hour = 0, minute = 0;
    double hangle, mangle;
    double difangle = 0;
    int i;
    int num;
    
    scanf("%d",&num);
    if (0 < num && num <= 10000) {
        for(i = 0; i < num; i++){
            scanf("%d:%d",&hour ,&minute);
            if ((0 <= hour && hour < 12) && (0 <= minute && minute < 60)) {
                hangle = (hour * 30) + ((double)minute / 2);
                mangle = minute * 6;
                difangle  = (hangle - mangle);
                if (difangle < 0) {
                    difangle *= -1;
                }
               // printf("%lf\n",hangle);
                //printf("%lf\n",mangle);
                if (difangle > 180) {
                    if (hour < 6 && 30 < minute) {
                        difangle = hangle + 360 - mangle;
                    }
                    else{
                        difangle = mangle + 360 - hangle;
                    }
                }
                if (0 <= difangle && difangle < 30) {
                    printf("alert\n");
                   // printf("%lf\n",difangle);
                }
                else if (90 <= difangle && difangle <= 180){
                    printf("safe\n");
                  //  printf("%lf\n",difangle);
                }
                else {
                    printf("warning\n");
                  //  printf("%lf\n",difangle);
                }
            }
        }
    }
    
    return 0;
}