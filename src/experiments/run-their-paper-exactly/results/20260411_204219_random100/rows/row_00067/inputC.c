```c
#include<stdio.h>

int main() {
	int loop;
	int A[100000];
	int N, T;
	int min = 1000000001;
	int gain = 0;
	int ans;
	scanf("%d %d", &N, &T);
	for (loop = 0; loop < N; loop++)scanf("%d", &A[loop]);

	for (loop = 0; loop < N; loop++) {
		if (min > A[loop])min = A[loop];
		else if (min < A[loop]) {
			if (gain < A[loop] - min) {
				gain = A[loop] - min;
				ans = 1;
			}
			else if (gain == A[loop] - min)ans++;
		}
	}
	printf("%d\n", ans);
}```