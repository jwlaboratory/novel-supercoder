```c
#include <stdio.h>
#include <string.h>


int main(){
	int N;	//文字列の長さN
	int K;	//文字列のK番目を指定するための変数
	char S[50];		//入力した文字列

	//scanf_s("%d %d", &N, &K);
	//scanf_s("%s", &S,50);

	scanf("%d %d", &N, &K);
	scanf("%s", &S);

	S[K - 1] = S[K - 1] + 32;
	printf("%s\n", S);
}```