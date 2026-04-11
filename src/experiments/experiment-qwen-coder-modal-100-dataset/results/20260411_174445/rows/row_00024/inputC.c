int main()
{
  int n,i,j,x;
  scanf("%d",&n);
  for(;n--;)
    {
      scanf("%d%d",&i,&j);
      if(i<6)
	{
	  for(;i-j;i+=i<j?1:-1)printf("%d ",i);	    
	}
      else
	{
	  for(x=-1;i-j;)
	    {      
	      printf("%d ",i);
	      if(i<6)
		i+=x;
	      else
		i++;
	      if(i==0)
		x=1;
	      if(i>9) i=5;
	    }
	}
      printf("%d\n",j);
    }
}