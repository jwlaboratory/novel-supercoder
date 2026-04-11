// AOJ 2883: Proof of Knowledge
// 2018.7.11 bal4u

#include <stdio.h>

char tr['d'+1];

char *calc(int *ans, char *S, char *P)
{
	int v1, v2;
	char op;
	
    if (*S == '[') {
        op = *(++S), S++;
        if (*S == '[') S = calc(&v1, S, P);
        else v1 = P[tr[*S++]];

        if (*S == '[') S = calc(&v2, S, P);
        else v2 = P[tr[*S++]];
		
        if      (op == '+') *ans = v1 | v2;
        else if (op == '*') *ans = v1 & v2;
        else                *ans = v1 ^ v2;
	} else *ans = P[tr[*S++]];
    while (*S == ']') S++;
    return S;
}

char S[100];
int main()
{
	int i, k, val, cnt;
	char P[10];
	
	for (i = 0; i < 4; i++) tr['a'+i] = i;
	while (fgets(S, 100, stdin) && *S != '.') {
		fgets(P, 10, stdin);
		for (i = 0; i < 4; i++) P[i] &= 0xf;
		calc(&val, S, P), cnt = 0;
		for (P[0] = 0; P[0] <= 9; P[0]++)
			for (P[1] = 0; P[1] <= 9; P[1]++)
				for (P[2] = 0; P[2] <= 9; P[2]++)
					for (P[3] = 0; P[3] <= 9; P[3]++) {
						calc(&k, S, P);
						if (k == val) cnt++;
					}
		printf("%d %d\n", val, cnt);
	}
	return 0;
}

