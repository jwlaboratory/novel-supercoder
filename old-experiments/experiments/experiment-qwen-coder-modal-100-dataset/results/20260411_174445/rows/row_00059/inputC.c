#include <stdio.h>

void bomb(int field[8][8],int x,int y);

int main(){
	int i,j,k,n;
	int field[8][8];
	char line[9];
	int x,y;
	
	scanf("%d",&n);
	for(i=1;i<=n;i++){		
		for(j=0;j<8;j++){
			scanf("%s",line);
			for(k=0;k<8;k++){
				field[j][k] = line[k] - '0';
			}
		}
		scanf("%d",&x);
		scanf("%d",&y);
		x--; y--;
		
		bomb(field,y,x);
		
		printf("Data %d:\n",i);
		for(j=0;j<8;j++){
			for(k=0;k<8;k++){
				printf("%d",field[j][k]);
			}
			printf("\n");
		}
	}
	
	return 0;
}

void bomb(int field[8][8],int x,int y){
	int i;
	field[x][y] = 0;
	for(i=1;i<=3&&x-i>=0;i++){
		if(field[x-i][y] == 1){
			field[x-i][y] = 0;
			bomb(field,x-i,y);
		}
	}
	for(i=1;i<=3&&x+i<8;i++){
		if(field[x+i][y] == 1){
			field[x+i][y] = 0;
			bomb(field,x+i,y);
		}
	}
	for(i=1;i<=3&&y-i>=0;i++){
		if(field[x][y-i] == 1){
			field[x][y-i] = 0;
			bomb(field,x,y-i);
		}
	}
	for(i=1;i<=3&&y+i<8;i++){
		if(field[x][y+i] == 1){
			field[x][y+i] = 0;
			bomb(field,x,y+i);
		}
	}
}