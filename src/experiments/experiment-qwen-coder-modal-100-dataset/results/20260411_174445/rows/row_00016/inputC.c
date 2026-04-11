#include <stdio.h>

int width,height;
char program[20][24];

char visited[20][20][16][4];

#define DIR_UP 0
#define DIR_LEFT 1
#define DIR_RIGHT 2
#define DIR_DOWN 3

const int dxy[4][2]={
	{0,-1},{-1,0},{1,0},{0,1}
};

int runProgram(int x,int y,int mem,int dir) {
	int isStop=0;
	int i;
	if(x<0)x=width-1;
	if(x>=width)x=0;
	if(y<0)y=height-1;
	if(y>=height)y=0;
	if(visited[x][y][mem][dir])return visited[x][y][mem][dir]-1;
	visited[x][y][mem][dir]=1;
	if(isdigit(program[y][x])) {
		isStop=runProgram(x+dxy[dir][0],y+dxy[dir][1],program[y][x]-'0',dir);
	} else {
		switch(program[y][x]) {
			case '<':
				isStop=runProgram(x-1,y,mem,DIR_LEFT);
				break;
			case '>':
				isStop=runProgram(x+1,y,mem,DIR_RIGHT);
				break;
			case '^':
				isStop=runProgram(x,y-1,mem,DIR_UP);
				break;
			case 'v':
				isStop=runProgram(x,y+1,mem,DIR_DOWN);
				break;
			case '_':
				if(mem==0) {
					isStop=runProgram(x+1,y,mem,DIR_RIGHT);
				} else {
					isStop=runProgram(x-1,y,mem,DIR_LEFT);
				}
				break;
			case '|':
				if(mem==0) {
					isStop=runProgram(x,y+1,mem,DIR_DOWN);
				} else {
					isStop=runProgram(x,y-1,mem,DIR_UP);
				}
				break;
			case '?':
				isStop|=runProgram(x-1,y,mem,DIR_LEFT);
				isStop|=runProgram(x+1,y,mem,DIR_RIGHT);
				isStop|=runProgram(x,y-1,mem,DIR_UP);
				isStop|=runProgram(x,y+1,mem,DIR_DOWN);
				break;
			case '.':
				isStop=runProgram(x+dxy[dir][0],y+dxy[dir][1],mem,dir);
				break;
			case '@':
				isStop=1;
				break;
			case '+':
				isStop=runProgram(x+dxy[dir][0],y+dxy[dir][1],(mem==15)?0:(mem+1),dir);
				break;
			case '-':
				isStop=runProgram(x+dxy[dir][0],y+dxy[dir][1],(mem==0)?15:(mem-1),dir);
				break;
		}
	}
	visited[x][y][mem][dir]+=isStop;
	return isStop;
}

int main(void) {
	int i;
	scanf("%d%d",&height,&width);
	for(i=0;i<height;i++)scanf("%s",program[i]);
	puts(runProgram(0,0,0,DIR_RIGHT)?"YES":"NO");
	return 0;
}