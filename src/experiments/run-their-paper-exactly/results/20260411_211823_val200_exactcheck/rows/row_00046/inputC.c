```c
M;m;main(N,q){
int c[8]={};
scanf("%d",&N);
for(int i=0;i<N;i++){
	scanf("%d",&q);
  	q/=400;
  	q<8?c[q]=1:M++;
}
for(int j=0;j<8;j++){
	M+=c[j];   
	m+=c[j];
}
if(!m)m++;
	printf("%d %d",m,M);
}```