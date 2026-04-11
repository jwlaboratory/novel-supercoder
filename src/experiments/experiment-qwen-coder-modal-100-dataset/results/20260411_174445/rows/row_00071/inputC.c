#include <stdio.h>
#define NMAX 100
#define AMAX 4
#define MOD 10007
#define MIN(a, b) ((a) < (b) ? (a) : (b))
int main(void)
{
  int i, j, k, l, m, J, K, L, M, x, n, a, prea = 0, s = 0;
  int binom[NMAX*AMAX+1][NMAX*AMAX+1] = {0}, dp[NMAX+1][NMAX*AMAX+1][AMAX*2][AMAX] = {0};
  for (i = 0; i <= NMAX * AMAX; i++) {
    binom[i][0] = binom[i][i] = 1;
    for (j = 1; j < i; j++) {
      binom[i][j] = (binom[i-1][j] + binom[i-1][j-1]) % MOD;
    }
  }
  scanf("%d", &n);
  dp[0][0][0][0] = 1;
  for (i = 0; i < n; i++) {
    scanf("%d", &a);
    long long dupli = 1;
    for (j = 1; j <= a; j++) dupli *= j;
    for (j = 0; j <= s + 1; j++) {
      for (k = 0; k <= 7; k++) {
	for (l = 0; l <= 3; l++) {
	  for (x = 1; x <= MIN(s + 1, a); x++) {
	    if (dp[i][j][k][l]) {
	      m = 2 * (prea - l) - k;
	      for(J = 0; J <= MIN(x, j); J++) {
		for(K = 0; K <= MIN(x - J, k); K++) {
		  for(L = 0; L <= MIN(x - J - K, l); L++) {
		    for(M = 0; M <= MIN(x - J - K - L, m); M++) {
		      dp[i+1][j+k+l-J-K-L][K+2*L+M][a-x] = (dp[i+1][j+k+l-J-K-L][K+2*L+M][a-x] + dupli * binom[a-1][x-1] * binom[j][J] * binom[k][K] * binom[l][L] * binom[m][M] * binom[s-j-k-l-m+1][x-J-K-L-M] * dp[i][j][k][l]) % MOD;
		    }
		  }
		}
	      }
	    }
	  }
	}
      }
    }
    s += a;
    prea = a;
  }
  printf("%d\n", dp[n][0][0][0]);
}
