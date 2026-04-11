#include <stdio.h>

int main(void) {
	int d_num,c_data;
	int xmin,ymin,xmax,ymax;
	int x,y;
	int num,i,count;
	scanf("%d",&d_num);
	for(c_data=0;c_data<d_num;c_data++) {
		scanf("%d%d%d%d",&xmin,&ymin,&xmax,&ymax);
		xmax+=xmin;ymax+=ymin;
		scanf("%d",&num);
		for(i=0,count=0;i<num;i++) {
			scanf("%d%d",&x,&y);
			if(xmin<=x && x<=xmax && ymin<=y && y<=ymax)count++;
		}
		printf("%d\n",count);
	}
	return 0;
}