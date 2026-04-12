int main(void)
{
  int a;int sum=0;
  int b;int t;
  scanf("%d%d%d",&a,&b,&t);
  for(int i=1;i*a<=t;i++)
  {
    sum+=b;
  }
  printf("%d",sum);
  return 0;
}