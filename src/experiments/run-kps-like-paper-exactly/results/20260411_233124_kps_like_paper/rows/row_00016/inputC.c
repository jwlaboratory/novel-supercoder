#include <stdio.h>

int main(void)
{
	int n;
	int i;
	int age;
	int than_ten, ten, twen, thir, four, fif, six;
	
	while (1){
		scanf("%d", &n);
		
		if (n == 0){
			break;
		}
		
		than_ten = ten = twen = thir = four = fif = six = 0;
		
		for (i = 0; i < n; i++){
			scanf("%d", &age);
			if (age >= 0 && age < 10){
				than_ten++;
			}
			else if (age < 20){
				ten++;
			}
			else if (age < 30){
				twen++;
			}
			else if (age < 40){
				thir++;
			}
			else if (age < 50){
				four++;
			}
			else if (age < 60){
				fif++;
			}
			else if (age >= 60){
				six++;
			}
		}
		
		printf("%d\n%d\n%d\n%d\n%d\n%d\n%d\n", than_ten, ten, twen, thir, four, fif, six);
		
	}
	
	return (0);
}