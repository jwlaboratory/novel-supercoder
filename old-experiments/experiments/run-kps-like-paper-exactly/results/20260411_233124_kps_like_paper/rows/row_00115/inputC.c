b,r,g,c,s,t;
main(){
	for(;scanf("%d%d%d%d%d%d",&b,&r,&g,&c,&s,&t),b|r|g|c|s|t;){
		printf("%d\n",100+b*(15+5*(1+15))+r*(15+3*(1+15))+g*7+c*2+s*3-t*3);
	}
	exit(0);
}