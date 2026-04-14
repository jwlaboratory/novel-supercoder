#include<stdio.h>
int main(void)
{
	int i,k;
	char x[81][12];
	FILE *kuku;

	kuku=fopen("kuku.txt","w");

	if(kuku==NULL)exit(0);

	for(i=1;i<=9;i++)
		for(k=1;k<=9;k++)
			fprintf(kuku,"%dx%d=%d\n",i,k,i*k);

	fclose(kuku);

	kuku=fopen("kuku.txt","r");

	for(i=0;i<81;i++){
		fgets(x[i],sizeof(x[i]),kuku);
		printf(x[i]);
	}

	fclose(kuku);

	return 0;
}