#include <stdio.h>

int main(void){
    int h,w;
    int i,j;
    while(1){
        scanf( "%d %d" , &h , &w );
        if( h == 0 && w == 0 ) break;
        for( i = 0; i < h ; i++ ){
            for( j = 0 ; j < w ; j++ ){
                if( j == w - 1 || j == 0 || i == h -1 || i == 0 ){
                    printf("#");
                }else{
                    printf(".");
                }
            }
            printf("\n");
        }
        printf("\n");
    }
}
