#include <stdio.h>
#include <string.h>

int main(void)
{
	int n;
	char event[8];
	int out = 0;
	int base[3] = {0};
	int i;
	int score;
	
	scanf("%d", &n);
			 
	while (n != 0){
		score = 0;
		base[0] = 0;
		base[1] = 0;
		base[2] = 0;
		out = 0;
		while (out < 3){
			scanf("%s", event);
			if (strcmp(event, "HIT") == 0){
				base[0]++;
				for (i = 0; i < 3; i++){
					if (base[i] > 1){
						if (i < 2){
							base[i + 1]++;
						}
						else {
							score++;
						}
						base[i]--;
					}
					
				}
			}
			else if (strcmp(event, "HOMERUN") == 0){
				for (i = 0; i < 3; i++){
					if (base[i] == 1){
						score++;
						base[i] = 0;
					}
				}
				score++;
			}
			else if (strcmp(event, "OUT") == 0){
				out++;
			}
		}
		printf("%d\n", score);
		n--;
	}
	
	return 0;
}