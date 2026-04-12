```c
strcmp();char s[5010],t[50000][6];i;j;k;l;main(m){for(gets(s);s[i];++i)for(j=5;j--;)memcpy(t[k++],s+i,j+1);qsort(t,k,6,strcmp);for(scanf("%d",&i);l<i;)strcmp(t[m++],t[m-1])&&l++;puts(t[m-2]);}```