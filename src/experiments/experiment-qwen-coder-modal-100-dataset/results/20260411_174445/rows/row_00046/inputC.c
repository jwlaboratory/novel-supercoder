#include <stdio.h>
#include <string.h>

#define H 104
#define W 104

#define C 2

int w, h;
char map[W][H];			//	マップ
int dx[2][6] = {{0, 0, 1, 1, 1, -1}, {0, 0, 1, -1, -1, -1}};
int dy[2][6] = {{-1, 1, -1, 0, 1, 0}, {-1, 1, 0, -1, 0, 1}};

int check(int nx, int ny)
{
	if (nx >= 0 && nx <= w + 1 && ny >= 0 && ny <= h + 1){
		return (1);
	}
	return (0);
}

void getWay(int x, int y)
{
	int i;
	
	map[x][y] = C;
	
	for (i = 0; i < 6; i++){
		int nx = x + dx[(y + 1) % 2][i];
		int ny = y + dy[(y + 1) % 2][i];
		
		if (check(nx,ny)){
			if (map[nx][ny] == 0){
				getWay(nx, ny);
			}
		}
	}
}

int main(void)
{
	int i, j, k;
	int length = 0;
	
	memset(map, 0, sizeof(map));
	scanf("%d%d", &w, &h);
	for (i = 0; i < h; i++){
		for (j = 0; j < w; j++){
			scanf("%d", &map[j + 1][i + 1]);
		}
	}
	
	getWay(0, 0);
	
	for (i = 0; i <= h + 1; i++){
		for (j = 0; j <= w + 1; j++){
			
			if (map[j][i] == 1){
				for (k = 0; k < 6; k++){
					int nx = j + dx[(i + 1) % 2][k];
					int ny = i + dy[(i + 1) % 2][k];
					
					if (check(nx, ny)){
						if (map[nx][ny] == C){
							length++;
						}
					}
				}
			}
		}
	}
	
	printf("%d\n", length);
	
	return (0);
}