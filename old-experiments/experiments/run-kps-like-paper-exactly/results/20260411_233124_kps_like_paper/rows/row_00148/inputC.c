#include <stdio.h>

int main(void){
	int A[3][3];
	int A_bin[3][3];
	int N;
	int b[100];
	int flag = 0;
	int k, i, j;

	for (i = 0; i < 3; i++) {
		for (j = 0; j < 3; j++) {
			scanf("%d", &A[i][j]);
			A_bin[i][j] = 0;
		}
	}
	scanf("%d", &N);
	for (k = 0; k < N; k++) {
		scanf("%d", &b[k]);
		for (i = 0; i < 3; i++) {
			for (j = 0; j < 3; j++) {
				if(A[i][j]==b[k]){ A_bin[i][j] = 1; }
			}
		}
	}


	for(k = 0; k < 3; k++){
		if ((A_bin[0][k] == 1)&&(A_bin[1][k] == 1)&&(A_bin[2][k] == 1)) { flag = 1; }
	}

	for(k = 0; k < 3; k++){
		if ((A_bin[k][0] == 1)&&(A_bin[k][1] == 1)&&(A_bin[k][2] == 1)) { flag = 1; }
	}
	
	if ((A_bin[0][0] == 1)&&(A_bin[1][1] == 1)&&(A_bin[2][2] == 1)) { flag = 1; }
	if ((A_bin[0][2] == 1)&&(A_bin[1][1] == 1)&&(A_bin[2][0] == 1)) { flag = 1; }


	if (flag == 1) { puts("Yes"); } else { puts("No"); }	

	return 0;
}
