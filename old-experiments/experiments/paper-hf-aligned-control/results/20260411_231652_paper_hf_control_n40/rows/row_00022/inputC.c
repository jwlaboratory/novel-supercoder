```c
c,i,k[30],x;main(n){for(;~scanf("%d",&i);)k[__builtin_ctz(i)]=--n&&(x^=i);for(i=30;i--;x&n&&(c++,x^=n*2-1))n=k[i]<<i;printf("%d",x?-1:c);}```