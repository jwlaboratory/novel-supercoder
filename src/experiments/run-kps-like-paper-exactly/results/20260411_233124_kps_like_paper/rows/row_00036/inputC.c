#include <stdio.h>
#define N 110

void sort(int data[], int left, int right)
{
	int sample = data[left], lptr = left, rptr = right;
	if (lptr < rptr){
		while (lptr != rptr){
			while ((sample < data[rptr]) && (lptr != rptr)) rptr--;
			if (lptr != rptr) data[lptr++] = data[rptr];
			while ((data[lptr] < sample) && (lptr != rptr)) lptr++;
			if (lptr != rptr) data[rptr--] = data[lptr];
		}
		data[lptr] = sample;
		sort(data, left, lptr - 1);
		sort(data, rptr + 1, right);
	}
}
int count(int data[], int n)
{
	int i, cnt = 1;
	for (i = 1; i < n; i++) {
		if (data[i] != data[i - 1]) cnt++;
	}
	return cnt;
}
int main(void)
{
	int n;
	int d[N];
	scanf("%d", &n);
	for (int i = 0; i < n; i++) scanf("%d", &d[i]);
	sort(d, 0, n - 1);
	printf("%d\n", count(d, n));
	return 0;
}