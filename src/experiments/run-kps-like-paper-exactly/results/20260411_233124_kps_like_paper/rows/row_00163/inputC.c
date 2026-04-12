#include <stdio.h>

int main()
{
    int iInputM, iInputF, iInputR;
    int iSum;
    int i;

    for (i = 0; i < 60; i++) {
        scanf("%d %d %d", &iInputM, &iInputF, &iInputR);
        if (iInputM == -1 && iInputF == -1 && iInputR == -1) break;
        iSum = iInputM + iInputF;
        if (iInputM == -1 || iInputF == -1) printf("F\n");
        else if (iSum >= 80) printf("A\n");
        else if (iSum >= 65) printf("B\n");
        else if (iSum >= 50) printf("C\n");
        else if (iSum >= 30) {
            if (iInputR >= 50) printf("C\n");
            else printf("D\n");
        }
        else printf("F\n");
    }

    return 0;
}
