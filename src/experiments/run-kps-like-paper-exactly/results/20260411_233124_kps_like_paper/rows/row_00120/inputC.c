#include <stdio.h>
#include <stdbool.h>

#define W 10
#define K 10

int Robmax(int data[], int size);

int main()
{
	int i,k;
	int Wmax, Kmax;
	int Wsum=0;
	int Ksum=0;
	int Wdata[W];
	int Kdata[K];
	for(i=0; i<W; i++){
		scanf("%d", &Wdata[i]);
	}
	for(k=0; k<K; k++){
		scanf("%d", &Kdata[k]);
	}
	for(i=0; i<3; i++){
		Wmax = Robmax(Wdata, W);
		Wsum += Wmax;
		Kmax = Robmax(Kdata, K);
		Ksum += Kmax;
	}
	printf("%d %d\n", Wsum, Ksum);
	return 0;
}

int Robmax(int data[], int size)
{
	int i;
	int idx = 0;
	int max = data[idx];
	for(i=0; i<size; i++){
		if(max < data[i]){
			max = data[i];
			idx = i;
		}
	}
	data[idx] = 0;
	return max;
}