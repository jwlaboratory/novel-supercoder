#include <stdio.h>
#include <stdbool.h>
#define N 8
#define NFR -1
#define FR 1

int row[N], col[N], dpos[2 * N - 1], dneg[2 * N - 1];
bool A[N][N];

void initialize()
{
    int i; //
    for (i = 0; i < N; i++)
    {
        row[i] = FR;
        col[i] = FR;
    }
    for (i = 0; i < 2 * N - 1; i++)
    {
        dpos[i] = FR;
        dneg[i] = FR;
    }
}

void print()
{
    int i, j;
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            if (A[i][j])
            {
                if (row[i] != j)
                    return;
            }
        }
    }

    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            if (row[i] != j)
                printf(".");
            else
                printf("Q");
        }
        printf("\n");
    }
}

void qeen(int i)
{
    int j;
    if (i == N)
    {
        print();
        return;
    }
    for (j = 0; j < N; j++)
    {
        if (col[j] == NFR || dpos[i + j] == NFR || dneg[i - j + (N - 1)] == NFR)
            continue;
        row[i] = j;
        col[j] = NFR;
        dpos[i + j] = NFR;
        dneg[i - j + (N - 1)] = NFR;
        
        qeen(i + 1);
        row[i] = FR;
        col[j] = FR;
        dpos[i + j] = FR;
        dneg[i - j + (N - 1)] = FR;
    }
}

int main()
{
    int i, j, k, r, c;

    initialize();
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            A[i][j] = false;
        }
    }
    scanf("%d", &k);
    for (i = 0; i < k; i++)
    {
        scanf("%d%d", &r, &c);
        A[r][c] = true;
    }
    qeen(0);

    return 0;
}

