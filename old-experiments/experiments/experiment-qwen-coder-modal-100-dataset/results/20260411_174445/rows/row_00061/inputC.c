#include<stdio.h>
 
int main(){
	int i,j;
	int n,m;
	char id[257][11];
	char try[257][11];
	int now;// 0:Close,1:Open
	char ans[2][11]={"Opened by ","Closed by "};
	int flag;

	while(scanf("%d",&n) != EOF){
		for(i = 0;i < n;i++){
			scanf("%s",id[i]);
		}
		scanf("%d",&m);
		for(i = 0;i < m;i++){
			scanf("%s",try[i]);
		}
		now = 0;

		for(i = 0;i < m;i++){
			for(flag = 0,j = 0;j < n;j++){
				if(strcmp(id[j],try[i]) == 0){
					flag = 1;
					break;
				}
			}
			if(flag){
				printf("%s%s\n",ans[now],try[i]);
				now++;
				now %=2;
			}else{
				printf("%s%s\n","Unknown ",try[i]);
			}
		}
	}
	return 0;
}