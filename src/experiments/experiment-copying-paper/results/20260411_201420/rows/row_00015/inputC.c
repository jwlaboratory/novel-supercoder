```c
#include <stdio.h>

int main()
{
    int n, a, b;
    int distance;
    
    scanf("%d %d %d", &n, &a, &b);

    distance = b - a;

    if ((distance % 2) == 0)
    {
	printf("Alice\n");
    }
    else
    {
	printf("Borys\n");
    }

    return 0;
}
```