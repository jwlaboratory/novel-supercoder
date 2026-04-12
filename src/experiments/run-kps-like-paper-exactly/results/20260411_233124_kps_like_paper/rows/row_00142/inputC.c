/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Ivan
 *
 * Created on July 3, 2018, 12:26 PM
 */

#include <stdio.h>
#include <stdlib.h>

typedef struct{
    char s;
    int v;
}Poker;
/*
 * 
 */
int charCompare(Poker a[], Poker b[], int n);
void bubbleSort(Poker a[], int n);
void selectionSort(Poker A[], int N);

int main(int argc, char** argv) {
    int n;
    
    scanf("%d", &n);
    Poker A[1900], B[1432];
    for (int i = 0; i < n; i++)
    {
        scanf(" %c %d", &A[i].s, &A[i].v);
        B[i] = A[i];
//        printf("%c%d\n", B[i].s, B[i].v);
    }
    bubbleSort(A, n);
    selectionSort(B, n);
    
    for (int k = 0; k < n; ++k) 
    {
        if (k) printf(" ");
        printf("%c%d", A[k].s, A[k].v);
    }
    printf("\nStable\n");
    
    for (int kx = 0; kx < n; ++kx) 
    {        
        if (kx) printf(" ");
        printf("%c%d", B[kx].s, B[kx].v);
    }
    if (charCompare(A, B, n)) printf("\nStable\n");
    else printf("\nNot stable\n");
    
    return (EXIT_SUCCESS);
}

int charCompare(Poker a[], Poker b[], int n)
{
    for (int i = 0; i < n; ++i) if (a[i].s != b[i].s) return 0;    
    return 1;
}

void bubbleSort(Poker a[], int n)
{
    for( int i = 0; i < n; i++ )
	{
            for( int j = n-1; j >= i; j-- )
            {
                if( a[j].v < a[j-1].v )
                {
                    Poker copy;
                    copy = a[j];
                    a[j] = a[j-1];
                    a[j-1] = copy;
                }
            }
	}
}

void selectionSort(Poker A[], int N)
{
    int i, j, minj;
    Poker t;
    for (i = 0; i < N; i++)
    {
        minj = i;
        for (j = i; j < N; j++) if (A[j].v < A[minj].v) minj = j;
        t = A[i]; A[i] = A[minj]; A[minj] = t;
//        if (i != minj) sw++;
    }
}

