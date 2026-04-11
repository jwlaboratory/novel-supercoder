#include <stdio.h>

int main(void){
    int i,j,k,n,a,b,dice[7],
        side[5] = {2,3,5,4,2};
    char order[7][3] = {"","","N","W","E","S","NN"};
    
    for(i=1;i<7;i++)
        scanf("%d", &dice[i]);
    
    scanf("%d", &n);
    
  //上面を合わせる
    for(i=0;i<n;i++){
        scanf("%d%d",&a,&b);
    
        for(j=1;dice[j]!=a;j++);
        
       //回転  
    
        for(k=0;order[j][k]!='\0';k++){
        
            dice[0] = dice[1];
        
            switch(order[j][k]){
                
                case 'E':
                    dice[1] = dice[4];
                    dice[4] = dice[6];
                    dice[6] = dice[3];
                    dice[3] = dice[0]; 
                    break;
            
                case 'N':
                    dice[1] = dice[2];
                    dice[2] = dice[6];
                    dice[6] = dice[5];
                    dice[5] = dice[0]; 
                    break;
            
                case 'S':
                    dice[1] = dice[5];
                    dice[5] = dice[6];
                    dice[6] = dice[2];
                    dice[2] = dice[0]; 
                    break;
                
                case 'W':
                    dice[1] = dice[3];
                    dice[3] = dice[6];
                    dice[6] = dice[4];
                    dice[4] = dice[0]; 
                    break;

            }
        }
        
        for(j=0;b!=dice[side[j]];j++);
        
        printf("%d\n",dice[side[j+1]]);
        
    }
    
    return 0;
}
