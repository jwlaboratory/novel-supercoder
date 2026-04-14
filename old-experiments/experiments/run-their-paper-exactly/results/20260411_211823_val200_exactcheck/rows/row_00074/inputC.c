```c
i;k;t;main(n){
        int c[501],f[500],s[500];
        for(scanf("%d",&n);k<n-1;k++)scanf("%d%d%d",&c[k],&s[k],&f[k]);
        
        for(;i<n-1;i++){
            t=0;
            for(int j=i;j<n-1;j++){
                if(t<=s[j]){
                    t=s[j]+c[j];
                }else{
                    t=s[j]+c[j]+ceil( ((double)t-(double)s[j])/(double)f[j] )*f[j];
                    
                }
            }
            printf("%d\n",t);
        }
        printf("0");
    }```