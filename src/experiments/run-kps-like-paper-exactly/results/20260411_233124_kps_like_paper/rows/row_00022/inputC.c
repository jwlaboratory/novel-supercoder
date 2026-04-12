#include <stdlib.h>
#include <stdio.h>

int main(){
	int n;
	int data[4][3][10];
	int i, j, k;
	int num;
	int b, f, r, v;

	scanf("%d", &num);

	for(i=0; i<4; i++){
		for(j=0; j<3; j++){
			for(k=0; k< 10; k++){
				data[i][j][k] = 0;
			}
		}
	}

	for(i=0; i<num; i++){
		scanf("%d %d %d %d", &b, &f, &r, &v);
		data[b-1][f-1][r-1] += v;
	}

	for(i=0; i<4; i++){
		for(j=0; j<3; j++){
			for(k=0; k< 10; k++){
				printf(" %d", data[i][j][k]);
			}
			printf("\n");
		}
		if(i<3){
			for(k=0; k<20; k++){
				printf("#");
			}
			printf("\n");
		}
	}

	return 0;

}
