#include <stdio.h>
#include <math.h>

int main(int argc, const char * argv[]){
    double r;
    scanf("%lf", &r);
    printf("%lf %lf\n", r * r * M_PI, r * 2 * M_PI);
}
