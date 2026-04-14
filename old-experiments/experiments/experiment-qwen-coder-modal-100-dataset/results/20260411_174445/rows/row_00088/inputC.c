
#include <stdio.h>



int main(void)
{
	//変数の宣言
	int n;
	signed int i=0;
	signed int array[50];
	int amari;
	
	//データの読み込み
	scanf("%d",&n);
//	printf("nは%dです\n", n);
//	printf("データの読み込み終了\n");
	//実際の処理
	
	while(n!=0){
		i++;
		array[i]=n%-2;
		if(array[i]==-1){
			n=n/-2+1;
			array[i]=1;
		}else{
			n=n/-2;
		}
	}
		
	
//	printf("計算部分終了\n");
	
	//出力
	if(i==0){
		printf("0");
	}else{
		while(i>0){
			printf("%d",array[i]);
			i--;
		}
	}
	
//	printf("結果の出力終了\n");
	
	return 0;
}
