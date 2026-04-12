/* 
 * File:   main.c
 * Author: s1252007
 *
 * Created on June 26, 2018, 11:39 AM
 */

#include <stdio.h>
#include <stdlib.h>
#define NIL -1

/*
 * 
 */

int BinarySearch(int *S, int n, int key);

int main(int argc, char** argv) {
    int n, q, checkSearch, counter = 0;
    int *S, *T;
    scanf("%d", &n);
    S = (int *)malloc(sizeof(int) * n);
    for (int i = 0; i < n; i++)
    {
        scanf("%d", &S[i]);
    }
    scanf("%d", &q);
    T = (int *)malloc(sizeof(int) * q);
    for (int j = 0; j < q; j++)
    {
        scanf("%d", &T[j]);
    }
    
    for (int ix = 0; ix < q; ix++)
    {
        checkSearch = BinarySearch(S, n, T[ix]);
        if (checkSearch != NIL) counter++;
    }
    printf("%d\n", counter);
    return (EXIT_SUCCESS);
}

int BinarySearch(int *S, int n, int key)
{
    int left = 0, counter = 0, right = n;
    while (left < right)
    {
        int mid = (left + right)/2;
        if (key == S[mid]) return mid;
        if (key > S[mid]) left = mid + 1;
        else if (key < S[mid]) right = mid;
    }
    return NIL;
}




