#include <stdio.h>
#include <string.h>

int main(){
	int a,b,i,j,x,y,n;
	int map[16][16];

	while(1){
		scanf("%d %d",&a,&b);
		if(!a && !b){
			break;
		}
		memset(map,0,sizeof(map));

		scanf("%d",&n);

		for(i = 0;i < n;i++){
			scanf("%d %d",&x,&y);
			map[y-1][x-1] = -1;
		}

		for(i = 0;i < a;i++){
			if(map[0][i] == -1){
				break;
			}
			map[0][i] = 1;
		}

		for(i = 0;i < b;i++){
			if(map[i][0] == -1){
				break;
			}
			map[i][0] = 1;
		}

		for(i = 1;i < b;i++){
			for(j = 1;j < a;j++){
				if(map[i][j] != -1){
					if(map[i-1][j] == -1){
						if(map[i][j-1] == -1){
							map[i][j] = 0;
						}else{
							map[i][j] = map[i][j-1];
						}
					}else{
						if(map[i][j-1] == -1){
							map[i][j] = map[i-1][j];
						}else{
							map[i][j] = map[i-1][j] + map[i][j-1];
						}
					}
				}
			}
		}

		printf("%d\n",map[b-1][a-1]);
	}

	return 0;
}