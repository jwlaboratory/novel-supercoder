# Val200 failure analysis (paper-exact pipeline)

**Run directory:** `/Users/shreybirmiwal/projects/jwlabs/novel-supercoder/src/experiments/run-their-paper-exactly/results/20260411_211823_val200_exactcheck`  
**Source:** `supercoder_bench/problem_results.json`  

## Headline counts


| Metric                         | Count |
| ------------------------------ | ----- |
| Total problems                 | 200   |
| **Correct** (all tests pass)   | 123   |
| **Compiled** (gcc linked)      | 158   |
| **Compile failed** (no binary) | 42    |
| **Compiled but wrong**         | 35    |


### Where the ~38.5% ‘failure mass’ goes

- **Compile failures** are cases where `gcc … -lm` never produced a runnable binary for the generated `.s`. Below we **re-run gcc** on the saved assembly and bucket stderr (syntax vs link vs other).
- **I/O failures** are cases that **compiled** but at least one test case failed: wrong stdout, runtime exit code, etc. SuperCoder records the **first failing** test per sample in `error_msg`.

## Compile failures: buckets (from fresh `gcc` on disk `.s`)

- **assembler_error** — 40
- **link_or_undefined_ref** — 2

### Example compile failures (read `gcc` stderr)

#### Row `row_00020` (problem_idx 19) — `assembler_error`

- **ASM file:** `rows/row_00020/out/qwen25_coder_7b_instruct.s`
- **gcc return code:** 1

```
/tmp/tmprwkygxbc/g.s: Assembler messages:
/tmp/tmprwkygxbc/g.s: Warning: end of file not at end of a line; newline inserted
/tmp/tmprwkygxbc/g.s:201: Error: unknown pseudo-op: `.lfe23'
```

Source C (first ~35 lines)

```c
#include <stdio.h>
#define max(x, y) ((x)<(y) ? (y) : (x))
#define min(x, y) ((x)>(y) ? (y) : (x))
#define sqr(x) ((x)*(x))

int main(){
  int n;  scanf("%d", &n);
  int a[105] = {0};
  int mini = 200, maxi = -200;
  for(int i=1; i<=n; i++){
    scanf("%d", a+i);
    mini = min(mini, a[i]);
    maxi = max(maxi, a[i]);
  }

  long ans = 100000000;
  for(int i=mini; i<=maxi; i++){
    long sum = 0;
    for(int j=1; j<=n; j++)
      sum = sum + (long)(sqr(a[j]-i));
    ans = min(ans, sum);
    if(!ans)  break;
  }

  printf("%ld\n", ans);

  return 0;
}
```



#### Row `row_00021` (problem_idx 20) — `assembler_error`

- **ASM file:** `rows/row_00021/out/qwen25_coder_7b_instruct.s`
- **gcc return code:** 1

```
/tmp/tmp8ie_lmlz/g.s: Assembler messages:
/tmp/tmp8ie_lmlz/g.s: Warning: end of file not at end of a line; newline inserted
/tmp/tmp8ie_lmlz/g.s:75: Error: can't resolve .note.gnu.property - .L32
/tmp/tmp8ie_lmlz/g.s: Error: local label `"3" (instance number 2 of a fb label)' is not defined
```

Source C (first ~35 lines)

```c
#include<stdio.h>
int main()
{
	char n[4];
	scanf("%s",n);
	if(n[0]==n[1]&&n[1]==n[2]||n[1]==n[2]&&n[2]==n[3]) printf("Yes\n");
	else printf("No\n");
	return 0;
}
```



#### Row `row_00023` (problem_idx 22) — `assembler_error`

- **ASM file:** `rows/row_00023/out/qwen25_coder_7b_instruct.s`
- **gcc return code:** 1

```
/tmp/tmp_dx7tmj_/g.s: Assembler messages:
/tmp/tmp_dx7tmj_/g.s: Warning: end of file not at end of a line; newline inserted
/tmp/tmp_dx7tmj_/g.s: Error: local label `"4" (instance number 1 of a fb label)' is not defined
```

Source C (first ~35 lines)

```c
#include <stdio.h>

int main(int argc, const char * argv[]) {
    int a, b;
    scanf("%d %d", &a, &b);
    
    if(a>b){
        printf("a > b\n");
    }else if(a<b){
        printf("a < b\n");
    }else{
        printf("a == b\n");
    }
    return 0;
}
```



#### Row `row_00024` (problem_idx 23) — `assembler_error`

- **ASM file:** `rows/row_00024/out/qwen25_coder_7b_instruct.s`
- **gcc return code:** 1

```
/tmp/tmpqizhueyn/g.s: Assembler messages:
/tmp/tmpqizhueyn/g.s: Warning: end of file not at end of a line; newline inserted
/tmp/tmpqizhueyn/g.s:192: Error: unknown pseudo-op: `.l15'
/tmp/tmpqizhueyn/g.s: Error: open CFI at the end of file; missing .cfi_endproc directive
```

Source C (first ~35 lines)

```c
#include <stdio.h>

int main () {
	int n, k, x ,y, sum = 0;
	scanf("%d", &n);
	scanf("%d", &k);
	scanf("%d", &x);
	scanf("%d", &y);
	
	for (int i = 1; i <= n; i++) {
		if ( i <= k ) {
			sum += x;
		}
		else if ( i > k) {
			sum += y;
		}
	}
	printf("%d", sum);
	return 0;
}```
```



#### Row `row_00032` (problem_idx 31) — `assembler_error`

- **ASM file:** `rows/row_00032/out/qwen25_coder_7b_instruct.s`
- **gcc return code:** 1

```
/tmp/tmp7f791r9z/g.s: Assembler messages:
/tmp/tmp7f791r9z/g.s: Warning: end of file not at end of a line; newline inserted
/tmp/tmp7f791r9z/g.s:32: Error: expecting `,' or `)' after base register in `(%rdx+1)'
/tmp/tmp7f791r9z/g.s:34: Error: operand type mismatch for `add'
```

Source C (first ~35 lines)

```c
#include<stdio.h>
#include<math.h>
int main(){
char s[100001];
scanf("%s",s);
int i,j;
for(i=j=0;s[i+1]!='\0';i++)j+=s[i]!=s[i+1];
printf("%d",j);
}```
```



#### Row `row_00035` (problem_idx 34) — `assembler_error`

- **ASM file:** `rows/row_00035/out/qwen25_coder_7b_instruct.s`
- **gcc return code:** 1

```
/tmp/tmpb95t4mx2/g.s: Assembler messages:
/tmp/tmpb95t4mx2/g.s: Warning: end of file not at end of a line; newline inserted
/tmp/tmpb95t4mx2/g.s:90: Error: can't resolve .note.gnu.property - .L32
/tmp/tmpb95t4mx2/g.s: Error: local label `"3" (instance number 2 of a fb label)' is not defined
```

Source C (first ~35 lines)

```c
#include<stdio.h>
int main()
{
	char s[4];
	scanf("%s",s);
	if(s[0]==s[1]&&s[0]==s[2]&&s[0]==s[3]){
		printf("No\n");
	}
	else if(s[0]==s[1]&&s[2]==s[3]||s[0]==s[2]&&s[1]==s[3]||s[0]==s[3]&&s[1]==s[2]){
		printf("Yes\n");
	}
	else{
		printf("No\n");
	}
	return 0;
}```
```



#### Row `row_00045` (problem_idx 44) — `assembler_error`

- **ASM file:** `rows/row_00045/out/qwen25_coder_7b_instruct.s`
- **gcc return code:** 1

```
/tmp/tmp0nyd9d89/g.s: Assembler messages:
/tmp/tmp0nyd9d89/g.s: Warning: end of file not at end of a line; newline inserted
/tmp/tmp0nyd9d89/g.s:139: Error: operand size mismatch for `movslq'
```

Source C (first ~35 lines)

```c
strcmp();char s[5010],t[50000][6];i;j;k;l;main(m){for(gets(s);s[i];++i)for(j=5;j--;)memcpy(t[k++],s+i,j+1);qsort(t,k,6,strcmp);for(scanf("%d",&i);l<i;)strcmp(t[m++],t[m-1])&&l++;puts(t[m-2]);}```
```



#### Row `row_00048` (problem_idx 47) — `assembler_error`

- **ASM file:** `rows/row_00048/out/qwen25_coder_7b_instruct.s`
- **gcc return code:** 1

```
/tmp/tmpfymskxz0/g.s: Assembler messages:
/tmp/tmpfymskxz0/g.s: Warning: end of file not at end of a line; newline inserted
/tmp/tmpfymskxz0/g.s:78: Error: CFI state restore without previous remember
```

Source C (first ~35 lines)

```c
#include <stdio.h>

int selectionSort(int A[], int N) {
  int i, j, t, sw = 0, mini;
  for(i=0; i<N-1; i++) {
    mini = i;
    for(j=i; j<N; j++) {
      if(A[j] < A[mini]) mini = j;
    }

  	t = A[i];
  	A[i] = A[mini];
  	A[mini] = t;

  	if(i != mini) sw++;
  }
  return sw;
}

int main(void) {
  int A[100], N, i, sw;
  scanf("%d", &N);
  for(i=0;i<N;i++) scanf("%d",&A[i]);

  sw = selectionSort(A,N);

  for(i=0;i<N;i++) {
    if(i>0) printf(" ");
    printf("%d",A[i]);
  }
  printf("\n");
  printf("%d\n", sw);

  return 0;
```



#### Row `row_00058` (problem_idx 57) — `assembler_error`

- **ASM file:** `rows/row_00058/out/qwen25_coder_7b_instruct.s`
- **gcc return code:** 1

```
/tmp/tmpxx1nhma4/g.s: Assembler messages:
/tmp/tmpxx1nhma4/g.s: Warning: end of file not at end of a line; newline inserted
/tmp/tmpxx1nhma4/g.s:64: Error: can't resolve .note.gnu.property - .L32
/tmp/tmpxx1nhma4/g.s: Error: local label `"3" (instance number 2 of a fb label)' is not defined
```

Source C (first ~35 lines)

```c
#include <stdio.h>
int main(){int m1,d1,m2,d2;scanf("%d%d%d%d",&m1,&d1,&m2,&d2);printf("%d",d2==1?1:0);
}```
```



#### Row `row_00062` (problem_idx 61) — `link_or_undefined_ref`

- **ASM file:** `rows/row_00062/out/qwen25_coder_7b_instruct.s`
- **gcc return code:** 1

```
/tmp/tmpzjq_yoe1/g.s: Assembler messages:
/tmp/tmpzjq_yoe1/g.s: Warning: end of file not at end of a line; newline inserted
/usr/bin/ld: /tmp/ccpNmjoY.o: in function `main':
temp.c:(.text.startup+0x3d): undefined reference to `.L5'
/usr/bin/ld: temp.c:(.text.startup+0x6d): undefined reference to `.L5'
/usr/bin/ld: temp.c:(.text.startup+0x8a): undefined reference to `.L5'
collect2: error: ld returned 1 exit status
```

Source C (first ~35 lines)

```c
i;main(a){for(;i%98?:puts("98 98"-!!i)*i%4802||~scanf("%d",&a);)putchar((i++%8||--a<1)^i<4704?46:35);}```
```



#### Row `row_00064` (problem_idx 63) — `assembler_error`

- **ASM file:** `rows/row_00064/out/qwen25_coder_7b_instruct.s`
- **gcc return code:** 1

```
/tmp/tmpe77kd7of/g.s: Assembler messages:
/tmp/tmpe77kd7of/g.s: Warning: end of file not at end of a line; newline inserted
/tmp/tmpe77kd7of/g.s: Error: local label `"4" (instance number 1 of a fb label)' is not defined
```

Source C (first ~35 lines)

```c
i,j,c,b,v,u,D[10000];main(N,K,T,U,V,L,x){
scanf("%d%d%d%d%d%d",&N,&K,&T,&U,&V,&L);
for(;i<N;i++)scanf("%d",&x),D[x]=1;
for(;j<L;b?v++,b--:u++,j++)if((c+=D[j])>K|(c&&!b))c--,b=T*V;
printf("%f\n",1.*v/V+1.*u/U);
exit(0);}```
```



#### Row `row_00074` (problem_idx 73) — `assembler_error`

- **ASM file:** `rows/row_00074/out/qwen25_coder_7b_instruct.s`
- **gcc return code:** 1

```
/tmp/tmpjltg6u_h/g.s: Assembler messages:
/tmp/tmpjltg6u_h/g.s: Warning: end of file not at end of a line; newline inserted
/tmp/tmpjltg6u_h/g.s:216: Error: junk at end of line, first unrecognized character is `0'
/tmp/tmpjltg6u_h/g.s:213: Error: can't resolve .L11 - .L1
/tmp/tmpjltg6u_h/g.s:214: Error: can't resolve .L41 - .L11
/tmp/tmpjltg6u_h/g.s: Error: local label `"1" (instance number 1 of a fb label)' is not defined
/tmp/tmpjltg6u_h/g.s: Error: local label `"0" (instance number 1 of a fb label)' is not defined
/tmp/tmpjltg6u_h/g.s: Error: local label `"4" (instance number 1 of a fb label)' is not defined
```

Source C (first ~35 lines)

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
```



#### Row `row_00075` (problem_idx 74) — `assembler_error`

- **ASM file:** `rows/row_00075/out/qwen25_coder_7b_instruct.s`
- **gcc return code:** 1

```
/tmp/tmpusdyd1dc/g.s: Assembler messages:
/tmp/tmpusdyd1dc/g.s: Warning: end of file not at end of a line; newline inserted
/tmp/tmpusdyd1dc/g.s:56: Error: symbol `.L6' is already defined
```

Source C (first ~35 lines)

```c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#define Rep(i,a,n)for(int i=(int)(a);i<(int)(n);i++)
#define rep(i,n)Rep(i,0,n)
typedef long long ll;
typedef long double ld;

int main() {
	int a=0, b=0, c=0, flag=0;
	char s;
	rep(i, 100001) {
		scanf("%c", &s);
		if (s == 'a')a++;
		else if (s == 'b')b++;
		else if (s == 'c')c++;
		else break;
	}
	if (fabs(b - a) > 1 || fabs(c - b) > 1 || fabs(a - c) > 1)printf("NO");
	else printf("YES");
}
```



#### Row `row_00165` (problem_idx 164) — `link_or_undefined_ref`

- **ASM file:** `rows/row_00165/out/qwen25_coder_7b_instruct.s`
- **gcc return code:** 1

```
/tmp/tmpiznxp29x/g.s: Assembler messages:
/tmp/tmpiznxp29x/g.s: Warning: end of file not at end of a line; newline inserted
/usr/bin/ld: /tmp/cchS3Rba.o: in function `main':
temp.c:(.text.startup+0x41): undefined reference to `.L2'
/usr/bin/ld: temp.c:(.text.startup+0x95): undefined reference to `.L8'
collect2: error: ld returned 1 exit status
```

Source C (first ~35 lines)

```c
#include <stdio.h>
#include <string.h>
#include <ctype.h>
int main(){
    int i;
    int cnt=0;
    char t1[1510];
    char t2[1510];
    
    scanf("%s",t1);
    for(i=0;i<strlen(t1);i++){
        t1[i]=tolower(t1[i]);
    }
    while(scanf("%s",t2)){
        if(strcmp(t2,"END_OF_TEXT")==0) break;
        for(i=0;i<strlen(t2);i++){
            t2[i]=tolower(t2[i]);
        }
        if(strcmp(t1,t2)==0) cnt++;
    }
    
    printf("%d\n",cnt);
    
    return 0;
}
```



## I/O failures (compiled but not `overall_correct`)

- **output_mismatch** — 23
- **runtime_nonzero_or_signal** — 12

**Runtime / mismatch sub-notes:**

- has_expected_actual: 23
- runtime_empty_stderr: 11
- runtime_with_stderr: 1

### Example I/O failures

#### Row `row_00008` (problem_idx 7) — `runtime_nonzero_or_signal`

- **ASM file:** `rows/row_00008/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 10**
- **First failing `error_msg`:**

```
Runtime error: b''
```

Source C (first ~35 lines)

```c
#include <stdio.h>
#include <strings.h>
int main() {
    int a,b;
    char s[15],t[15],u[15];
    scanf("%s %s", &s, &t);
    scanf("%d %d", &a, &b);
    scanf("%s", &u);
    if(strcmp(s,u) == 0) {
        --a;
    } else if(strcmp(t,u) == 0) {
        --b;
    }
    printf("%d %d\n", a, b);
    return 0;
}```
```



#### Row `row_00011` (problem_idx 10) — `runtime_nonzero_or_signal`

- **ASM file:** `rows/row_00011/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 10**
- **First failing `error_msg`:**

```
Runtime error: b''
```

Source C (first ~35 lines)

```c
#include<stdio.h>
int main()
{

    char a[11],b[11],c[11];
    int x , y, t;

    scanf("%s",a);
    scanf("%s",b);
    scanf("%s",c);

    x=strlen(a)-1;
    y=strlen(b)-1;
    t=strlen(c)-1;

        if((a[x]==b[0])&&(b[y]==c[0]))
        {
            printf("YES\n");
        }
        else
        {
            printf("NO\n");
        }

    return 0;
}```
```



#### Row `row_00012` (problem_idx 11) — `output_mismatch`

- **ASM file:** `rows/row_00012/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **1 / 10**
- **First failing `error_msg`:**

```
Output mismatch Expected: 2 Actual: IMPOSSIBLE
```

Source C (first ~35 lines)

```c
#include<stdio.h>

int main()
{
    int a,b,y,temp;
    double x;
    scanf("%d %d", &a,&b);
    if(b>a)
    {
        temp = a;
        a = b;
        b = temp;
    }
    x=(double)((a-b)/2.00);
    y=((a-b)/2);
    if((x-(double)y)==0)
        printf("%d", a-y);
    else
        printf("IMPOSSIBLE");
    return 0;
}
```



#### Row `row_00022` (problem_idx 21) — `output_mismatch`

- **ASM file:** `rows/row_00022/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 1**
- **First failing `error_msg`:**

```
Output mismatch Expected: 3 Actual: 2
```

Source C (first ~35 lines)

```c
c,i,k[30],x;main(n){for(;~scanf("%d",&i);)k[__builtin_ctz(i)]=--n&&(x^=i);for(i=30;i--;x&n&&(c++,x^=n*2-1))n=k[i]<<i;printf("%d",x?-1:c);}```
```



#### Row `row_00025` (problem_idx 24) — `runtime_nonzero_or_signal`

- **ASM file:** `rows/row_00025/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 10**
- **First failing `error_msg`:**

```
Runtime error: b''
```

Source C (first ~35 lines)

```c
#include<stdio.h>
int main(){
  int n,p[100001],i,t;
  scanf("%d",&n);
  for(i=0;i<n;i++){scanf("%d",&t);p[i]=i+1==t;}
  t=0;for(i=0;i<n;i++)if(p[i]){t++;p[i]=p[i+1]=0;}
  printf("%d",t);
}
```



#### Row `row_00033` (problem_idx 32) — `runtime_nonzero_or_signal`

- **ASM file:** `rows/row_00033/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 1**
- **First failing `error_msg`:**

```
Runtime error: b''
```

Source C (first ~35 lines)

```c
#include <stdio.h>
int main(void) {
    int num,que,i,year[51];
    char name[51][31];
    scanf("%d %d",&num,&que);
    for (i=0; i<num; i++) {
        scanf("%d %s",&year[i],name[i]);
    }
    i=0;
    while (year[i]<=que&&i<num) {
        i++;
    }
    if (i==0) {
        printf("kogakubu10gokan\n");
    } else {
        printf("%s\n",name[i-1]);
    }
    return 0;
}```
```



#### Row `row_00034` (problem_idx 33) — `runtime_nonzero_or_signal`

- **ASM file:** `rows/row_00034/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 10**
- **First failing `error_msg`:**

```
Runtime error: b''
```

Source C (first ~35 lines)

```c
#include<stdio.h>
#include<stdlib.h>
int N,T,D[100000],i,j,t;
long long R=1;
int M=1000000007;
int cmp(const void*a,const void*b){return *(int*)a-*(int*)b;}

int main()
{
	scanf("%d%d",&N,&T);
	for(i=0;i<N;i++)
	{
		scanf("%d",&D[i]);
	}
	qsort(D,N,4,cmp);
	for(i=t=0;i<N;i++)
	{
		for(;t<N&&D[i]+T>=D[t];t++);
		R=R*(t-i)%M;
	}
	printf("%lld\n",R);
	return 0;
}```
```



#### Row `row_00037` (problem_idx 36) — `output_mismatch`

- **ASM file:** `rows/row_00037/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **8 / 10**
- **First failing `error_msg`:**

```
Output mismatch Expected: No Actual: 
```

Source C (first ~35 lines)

```c
#include<stdio.h>
int main()
{
    int a,i,n;
    scanf("%d%d",&n,&a);
    if(a==0)
        {
        if(n%500==0)
                {
                printf("Yes");
                }
        else
               {
                printf("No");
               }
        }
    else if(a>0 && a<=1000)
    {
        i=n%500;
        if(i<=a)
            {
            printf("Yes");
           }
        else
            {
            printf("No");
            }
    }
    return 0;
}
```



#### Row `row_00038` (problem_idx 37) — `output_mismatch`

- **ASM file:** `rows/row_00038/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **8 / 10**
- **First failing `error_msg`:**

```
Output mismatch Expected: No Actual: Yes
```

Source C (first ~35 lines)

```c
#include<stdio.h>

int main(void){
  int A,B,C,D,count;
  scanf("%d %d %d %d",&A,&B,&C,&D);
  do{
    C-=B;
    if(C<=0){
      count=1;
      break;
    }
    A-=D;
    if(A<=0){
      count=0;
      break;
    }
  }while(A>0&&C>0);
  
  if(count)
    printf("Yes");
  else
    printf("No");
  
  return 0;
}```
```



#### Row `row_00041` (problem_idx 40) — `runtime_nonzero_or_signal`

- **ASM file:** `rows/row_00041/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 10**
- **First failing `error_msg`:**

```
Runtime error: b''
```

Source C (first ~35 lines)

```c
#include<stdio.h>

int main(){
  long n = 0;
  long maxi = 0;
  long i = 0;
  long remove = 0;
  scanf("%ld",&n);
  for(i=1;i<n;i++){
    if(((i+1)*i)/2 >= n){
      break;
    }
  }
  maxi = i;
  //printf("%ld",maxi);
  remove = (maxi*(maxi+1))/2 - n;
  //printf("%ld %ld ",maxi,remove);
  for(i=1;i<=maxi;i++){
    if(i != remove){
      printf("%ld\n",i);
    }
  }
  return 0;
}```
```



#### Row `row_00047` (problem_idx 46) — `output_mismatch`

- **ASM file:** `rows/row_00047/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **9 / 10**
- **First failing `error_msg`:**

```
Output mismatch Expected: 1 Actual: 0
```

Source C (first ~35 lines)

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>




int main(void){
int x;
scanf("%d",&x);
//分類
if(x>=2000){printf("1");return 0;}

//総当たり
int a=0,b=0,c=0,d=0,e=0,f=0;
const int TIME=20;
    for(a=0;a<TIME;a++){
        for(b=0;b<TIME;b++){
            for(c=0;c<TIME;c++){
                for(d=0;d<TIME;d++){
                    for(e=0;e<TIME;e++){
                        for(f=0;f<TIME;f++){
                            if(a*100+b*101+c*102+d*103+e*104+f*105==x){printf("1");return 0;}
                        }
                    }
                }
            }
        }
    }

printf("0");
}
```



#### Row `row_00053` (problem_idx 52) — `output_mismatch`

- **ASM file:** `rows/row_00053/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **2 / 10**
- **First failing `error_msg`:**

```
Output mismatch Expected: DENIED Actual: APPROVED
```

Source C (first ~35 lines)

```c
#include <stdio.h>
#include <string.h>
int main(void){
  int n,a,gs,ok;
  scanf("%d",&n);
  gs=ok=0;
  for(int i=0;i<n;i++){
    scanf("%d",&a);
    if(a%2==0){          //goosoo
    gs++;
     if(a%3==0||a%5==0){
       ok++;
     }
    }
  }
  if(gs==ok){
    printf("APPROVED");
  }else{
    printf("DENIED");
  }
  return 0;
}```
```



#### Row `row_00063` (problem_idx 62) — `runtime_nonzero_or_signal`

- **ASM file:** `rows/row_00063/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 10**
- **First failing `error_msg`:**

```
Runtime error: b''
```

Source C (first ~35 lines)

```c
#include <stdio.h>

int main(){
  int l = 0;
  scanf("%d",&l);
  int n = 1;
  int m = 0;

  int tmp = l;
  while(tmp > 1){
    if(tmp%2==1){
      m = m+1;
    }
    tmp = tmp/2;
    n = n+1;
    m = m+2;
  }
  printf("%d %d\n",n,m);

  int i = 1;
  tmp = l;
  for(i=1;i<n;i++){
    printf("%d %d %d\n",i,i+1,(tmp+1)/2);
    printf("%d %d %d\n",i,i+1,0);
    if(tmp%2==1){
      printf("%d %d %d\n",i,n,tmp/2);
    }
    tmp = tmp/2;
  }
  return 0;
}
```



#### Row `row_00065` (problem_idx 64) — `output_mismatch`

- **ASM file:** `rows/row_00065/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 10**
- **First failing `error_msg`:**

```
Output mismatch Expected: #.#. .#.# #.#.  #.#.#. .#.#.# #.#.#. .#.#.# #.#.#.  #.# .#. #.#  #. .#     Actual: 
```

Source C (first ~35 lines)

```c
#include<stdio.h>

int main(){
  int h,w;
  int i,j;

  while (1){
    scanf("%d %d", &h, &w);
    if(h==0 && w==0){
      break;
    }
    for(i=0;i<h;i++){
      for(j=0;j<w;j++){
        if(((i%2)+(j%2))%2==0){
          printf("#");
        }
        else{
          printf(".");
        }
      }
      printf("\n");
    }
    printf("\n");
  }

  return 0;
}

```



#### Row `row_00067` (problem_idx 66) — `output_mismatch`

- **ASM file:** `rows/row_00067/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **4 / 10**
- **First failing `error_msg`:**

```
Output mismatch Expected: YES Actual: NO
```

Source C (first ~35 lines)

```c
#include<stdio.h>
int main(void)
{
    int r, g, b, k = 0;
    scanf("%d", &r);
    scanf("%d", &g);
    scanf("%d", &b);

    k = 100 * r + 10 * g + b;

    if (k % 4 == 0) {
        printf("YES");
    }
    else {
        printf("NO");
    }
    return 0;
}```
```



#### Row `row_00069` (problem_idx 68) — `output_mismatch`

- **ASM file:** `rows/row_00069/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 10**
- **First failing `error_msg`:**

```
Output mismatch Expected: 5  Actual: 0 
```

Source C (first ~35 lines)

```c
#include <stdio.h>

int main(void){

	long long int X;
	scanf("%lld", &X);

	long long int i;
	long long kake = 0;

	for(i = 0; i < 1000000000; i++){
		
		kake  = i * (i + 1);

		if(2 * X <= kake){
			break;
		}

	}

	printf("%lld\n", i);

	return 0;

}
```



#### Row `row_00070` (problem_idx 69) — `output_mismatch`

- **ASM file:** `rows/row_00070/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **2 / 10**
- **First failing `error_msg`:**

```
Output mismatch Expected: Yes  Actual: No 
```

Source C (first ~35 lines)

```c

#include<stdio.h>
int main()
{
    int N,A,i;
    scanf("%d",&N);
    scanf("%d",&A);
    i = N%500;
    if(i == 0)
    {
        printf("Yes\n");
    }
    else if(i <= A)
    {
        printf("Yes\n");
    }
    else
    {
        printf("No\n");
    }
    return 0;
}
```



#### Row `row_00090` (problem_idx 89) — `output_mismatch`

- **ASM file:** `rows/row_00090/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 10**
- **First failing `error_msg`:**

```
Output mismatch Expected: No Actual: Yes
```

Source C (first ~35 lines)

```c
#include<stdio.h>
#include<string.h>
int main(void){
char s[11];
  scanf("%s",&s);
  
 for(int i=0;i<strlen(s);i+=2){
   if(s[i]!='h'||s[i+1]!='i'){
printf("No");
     return 0;
   }
 }
printf("Yes");
  
  return 0;
}```
```



#### Row `row_00093` (problem_idx 92) — `output_mismatch`

- **ASM file:** `rows/row_00093/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **1 / 10**
- **First failing `error_msg`:**

```
Output mismatch Expected: 1  Actual: 0 
```

Source C (first ~35 lines)

```c
unsigned long long popcnt64(unsigned long long n){
	const unsigned long long m1=0x5555555555555555ULL;
	const unsigned long long m2=0x3333333333333333ULL;
	const unsigned long long m4=0x0f0f0f0f0f0f0f0fULL;
	const unsigned long long m8=0x00ff00ff00ff00ffULL;
	const unsigned long long m16=0x0000ffff0000ffffULL;
	const unsigned long long m32=0x00000000ffffffffULL;
	n=((n>>1)&m1)+(n&m1);
	n=((n>>2)&m2)+(n&m2);
	n=((n>>4)&m4)+(n&m4);
	n=((n>>8)&m8)+(n&m8);
	n=((n>>16)&m16)+(n&m16);
	n=((n>>32)&m32)+(n&m32);
	return n;
}
unsigned long long clz64(unsigned long long n){
	n|=n>>1;
	n|=n>>2;
	n|=n>>4;
	n|=n>>8;
	n|=n>>16;
	n|=n>>32;
	return 64-popcnt64(n);
}

#include <stdio.h>
int main(){
	long long N;
	scanf("%lld",&N);
	printf("%d\n",64-clz64(N));
	return 0;
}```
```



#### Row `row_00094` (problem_idx 93) — `runtime_nonzero_or_signal`

- **ASM file:** `rows/row_00094/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 10**
- **First failing `error_msg`:**

```
Runtime error: b''
```

Source C (first ~35 lines)

```c
#include <stdio.h>

int N;
int a[114514];

int main(void) {
	int i;
	int minIndex, minValue;
	if (scanf("%d", &N) != 1) return 1;
	for (i = 0; i < N; i++) {
		if (scanf("%d", &a[i]) != 1) return 1;
	}
	minIndex = 0;
	minValue = a[0];
	for (i = 1; i < N; i++) {
		if (a[i] < minValue) {
			minIndex = i;
			minValue = a[i];
		}
	}
	printf("%d\n", minIndex + 1);
	return 0;
}

```



#### Row `row_00101` (problem_idx 100) — `output_mismatch`

- **ASM file:** `rows/row_00101/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 10**
- **First failing `error_msg`:**

```
Output mismatch Expected: 12 Actual: 1
```

Source C (first ~35 lines)

```c
#include <stdio.h>

int main() {
	
	int n, k, x=1, y=1, hasil;
	
	scanf("%d", &n);
	scanf("%d", &k);
	
	for(int i=0; i<n; i++){
		if(x*2<=x+k){
			x*=2;
		}
		else if(x*2>x+k){
			x+=k;
		}
	}
	
	printf("%d", x);
	return 0;
}```
```



#### Row `row_00109` (problem_idx 108) — `runtime_nonzero_or_signal`

- **ASM file:** `rows/row_00109/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 1**
- **First failing `error_msg`:**

```
Runtime error: b''
```

Source C (first ~35 lines)

```c
#include <stdio.h>

int main (void){

	char s[100000];
	scanf("%s",s);

	int count = 0;
	int i;

	for(i = 0; s[i] != '\0'; i++){

		if(s[i] != s[i + 1]){
			count++;
		}
	}

	printf("%d\n", count - 1);

	return 0;


}```
```



#### Row `row_00110` (problem_idx 109) — `output_mismatch`

- **ASM file:** `rows/row_00110/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 1**
- **First failing `error_msg`:**

```
Output mismatch Expected: 2  Actual: 1 
```

Source C (first ~35 lines)

```c
#include <stdio.h>

int main()
{
	long long x;
	scanf("%lld", &x);
	
	long long ans = (x - 1) / 11 * 2;
	if ((x - 1) % 11 < 6) ans += 1;
	else ans += 2;
	
	printf("%lld\n", ans);
	fflush(stdout);
	return 0;
}```
```



#### Row `row_00115` (problem_idx 114) — `runtime_nonzero_or_signal`

- **ASM file:** `rows/row_00115/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 10**
- **First failing `error_msg`:**

```
Runtime error: b'*** stack smashing detected ***: terminated\n'
```

Source C (first ~35 lines)

```c
#include <stdio.h>
#include <string.h>

int main(){
	char a[20];
	scanf("%s", &a);
	memset(a+3, '\0', 17);
	printf("%s\n", a);

	return 0;
}```
```



#### Row `row_00125` (problem_idx 124) — `output_mismatch`

- **ASM file:** `rows/row_00125/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **5 / 10**
- **First failing `error_msg`:**

```
Output mismatch Expected: Yes  Actual: No 
```

Source C (first ~35 lines)

```c
#include<stdio.h>

int main()
{
    int R;

    scanf("%d",&R);
    int Q;
    int maxi=0;
    int total = 0;
    for(int i=1;i<=R;i++)
    {
        scanf("%d",&Q);
        total+=Q;
        if(Q>maxi)
        {
        maxi=Q;
        }
    }
    if(total-maxi>maxi)
        printf("Yes\n");
    else
        printf("No\n");
    return 0;
}
```



#### Row `row_00179` (problem_idx 178) — `runtime_nonzero_or_signal`

- **ASM file:** `rows/row_00179/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 10**
- **First failing `error_msg`:**

```
Runtime error: b''
```

Source C (first ~35 lines)

```c
#include <stdio.h>
#include <math.h>

int main(void) {

  long n;
  scanf("%ld", &n);
  long max = sqrt(n*2);
  long sum = max*(max+1)/2;
  while (sum < n) {
    max++;
    sum += max;
  }
  for (long i = 1; i <= max; i++) {
    if (sum-n == i) {
      continue;
    }
    printf("%ld\n", i);
  }

  return 0;
}```
```



#### Row `row_00186` (problem_idx 185) — `runtime_nonzero_or_signal`

- **ASM file:** `rows/row_00186/out/qwen25_coder_7b_instruct.s`
- Tests passed (benchmark subset): **0 / 10**
- **First failing `error_msg`:**

```
Runtime error: b''
```

Source C (first ~35 lines)

```c
char*s,T['   '],*r=T;U[1<<27];n;k;main(i){for(;gets(r+1);k=!--n)for(;*++r&=31;)U[r-T]=k|=!!n<<*r;for(;~i--;)for(s=r;s-->T;k=U[k]=U[k-=~-~*s<<21]?:*s?s-T:0)n+=__builtin_popcount(U[s-T]&(U[k+'   ']^=!s[-1]<<*s));printf("%d",n+1);}```
```



## Implications for multi-turn / agentic repair

- **Compile buckets** mix “trivial” issues (illegal insn, bad prologue, stray text) with **harder** link / ABI issues. An agent that sees **gcc stderr** can often fix syntax-level mistakes in a second turn.
- `**output_mismatch`** is the classic “wrong algorithm / off-by-one / formatting” bucket — often needs **reasoning or test feedback**, not just the compiler.
- `**runtime_nonzero_or_signal`** with empty stderr may be **silent crashes** (UB, segfault); multi-turn runs benefit from **running under gdb or sanitizers** (not in this script).

