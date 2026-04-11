#include <ctype.h>
#include <float.h>
#include <inttypes.h>
#include <limits.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>
#ifdef __cplusplus
#include <bits/stdc++.h>
#endif

#define ROOT(d, x) (d).root(&(d), (x))
#define UNITE(d, x, y) (d).unite(&(d), (x), (y))
#define UPDATE(d, x, y) (d).update(&(d), (x), (y))
#define QUERY(d, ...) (d).query(&(d), ##__VA_ARGS__)


static inline int get(void);
static inline void put(int);

int32_t nextint(void);
int64_t nextlong(void);
uint32_t nextstr(char *);
void printint(int32_t);
void printlong(int64_t);
void rsort_d32(void *base, const int n, const int size, const int index);
void rsort_r32(void *base, const int n, const int size, const int index);

static inline uint32_t flp2(uint32_t x);



typedef struct union_find{
	int *p_prev, *p_rank, *p_size;
	int (*root)(struct union_find *, int);
	void (*unite)(struct union_find *, int, int);
	int (*size)(struct union_find *, int);
} union_find;

void union_find_init(struct union_find *p, int n);


/* main */





union_find d;

int main(void){
	int n=nextint();
	int m=nextint();
	union_find_init(&d, n+1);
	for(int i=0; i<m; i++){
		int a=nextint();
		int b=nextint();
		UNITE(d, a, b);
	}
	int ans=-1;
	for(int i=1; i<=n; i++){
		if(ROOT(d, i) == i) ans++;
	}
	printf("%d\n", ans);
}

/* definition */


static inline int get(void){ return getchar_unlocked(); }
static inline void put(int c){ putchar_unlocked(c); }

int32_t nextint(void){ char c=get(); while(c!='-'&&(c<'0'||'9'<c)) c=get(); bool s=false; if(c=='-'){s=true;c=get();} uint32_t x=0; while('0'<=c && c<='9'){ x=x*10+c-'0'; c=get(); } return s?-x:x; }
int64_t nextlong(void){ char c=get(); while(c!='-'&&(c<'0'||'9'<c)) c=get(); int s=0; if(c=='-'){s=1;c=get();} uint64_t x=0; while('0'<=c && c<='9'){ x=x*10+c-'0'; c=get(); } return s?-x:x; }
uint32_t nextstr(char *s){ char c=get(); while(c==' '||c=='\n') c=get(); uint32_t len=0; while(c!=' '&&c!='\n'){ *s++=c; len++; c=get(); } *s='\0'; return len; }
void printint(int32_t x){ if(x<0){x=-x; putchar('-');}else if(x==0){putchar('0');} int d=0; char s[10]; while(x){ s[d]='0'+x%10; x/=10; d++; } for (int i=d-1; i>=0; i--) putchar(s[i]); putchar('\n'); }
void printlong(int64_t x){ if(x<0){x=-x; putchar('-');}else if(x==0){putchar('0');} int d=0; char s[20]; while(x){ s[d]='0'+x%10; x/=10; d++; } for (int i=d-1; i>=0; i--) putchar(s[i]); putchar('\n'); }

void rsort_d32(void *base, const int count, const int size, const int index){
	typedef int32_t rsort_t;
	rsort_t (*a)[size] = (rsort_t(*)[size]) base;
	rsort_t (*b)[size] = (rsort_t(*)[size]) malloc(count*size*sizeof(rsort_t));
	int c[0x100];
	for(int k=0; k<4; k++){
		memset(c, 0, sizeof(c)); for(int i=0; i<count; i++){ c[(a[i][index]>>(k<<3))&0xFF]++; } for(int i=1; i<0x100; i++) c[i]+=c[i-1]; for(int i=count-1; i>=0; i--){ int to=--c[(a[i][index]>>(k<<3))&0xFF]; for(int j=0; j<size; j++){ b[to][j]=a[i][j]; } }{rsort_t(*t)[size]=a; a=b; b=t;}
	}
	free(b);
}
void rsortr_d32(void *base, const int count, const int size, const int index){
	typedef int32_t rsort_t;
	rsort_t (*a)[size] = (rsort_t(*)[size]) base;
	rsort_t (*b)[size] = (rsort_t(*)[size]) malloc(count*size*sizeof(rsort_t));
	int c[0x100];
	for(int k=0; k<4; k++){
		memset(c, 0, sizeof(c)); for(int i=0; i<count; i++){ c[(a[i][index]>>(k<<3))&0xFF]++; } for(int i=0xFE; i>=0; i--) c[i]+=c[i+1]; for(int i=count-1; i>=0; i--){ int to=--c[(a[i][index]>>(k<<3))&0xFF]; for(int j=0; j<size; j++){ b[to][j]=a[i][j]; } }{rsort_t(*t)[size]=a; a=b; b=t;}
	}
	free(b);
}

static inline uint32_t flp2(uint32_t x){ return 0x80000000>>(__builtin_clz(x-1)-1); }



static int union_find_root(struct union_find *p, int x){ return p->p_prev[x]==x?x:(p->p_prev[x]=union_find_root(p, p->p_prev[x])); }
static int union_find_size(struct union_find *p, int x){ return p->p_size[union_find_root(p, x)]; }
static void union_find_unite(struct union_find *p, int x, int y){
	x=union_find_root(p, x), y=union_find_root(p, y); if(x==y) return;
	if(p->p_rank[x]<p->p_rank[y]){
		p->p_prev[x]=y; p->p_size[y]+=p->p_size[x];
	}else if(p->p_rank[x]>p->p_rank[y]){
		p->p_prev[y]=x; p->p_size[x]+=p->p_size[y];
	}else{
		p->p_prev[x]=y; p->p_rank[y]++; p->p_size[y]+=p->p_size[x];
	}
}
void union_find_init(struct union_find *p, int n){
	p->p_prev = (int*) malloc(n*sizeof(int));
	p->p_rank = (int*) malloc(n*sizeof(int));
	p->p_size = (int*) malloc(n*sizeof(int));
	p->root = union_find_root;
	p->unite = union_find_unite;
	p->size = union_find_size;
	for(int i=0; i<n; i++){ p->p_prev[i]=i; p->p_rank[i]=1; p->p_size[i]=1; }
}


