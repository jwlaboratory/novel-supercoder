```c
#include <stdio.h>
#include <inttypes.h>

int main(void) {
	uint64_t N;
	uint64_t a, sum = 0;
	if (scanf("%" SCNu64, &N) != 1) return 1;
	for (a = 1; a * a <= N; a++) {
		if (N % a == 0) {
			uint64_t m = N / a - 1;
			if (m > 0 && N % m == N / m) sum += m;
		}
		if (N % a == 0 && a != N % a) {
			uint64_t m = a - 1;
			if (m > 0 && N % m == N / m) sum += m;
		}
	}
	printf("%" PRIu64 "\n", sum);
	return 0;
}

/*

N = a * m + a

N = a * (m + 1)

m = N / a - 1


*/
```