/*
 * main.c
 *
 *  Created on: 2020/07/27
 *      Author: 113896
 */

#include <stdio.h>

int main() {

	int a, b, c;
	scanf("%d%d%d", &a, &b, &c);

	if (a < b && b < c) {
		printf("Yes\n");
	} else {
		printf("No\n");
	}

	return 0;
}

