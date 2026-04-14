#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DIJKSTRA_MAX_NODE 100000
#define DIJKSTRA_MAX_EDGE 400000

typedef struct {
	int from,to;
	int cost;
} dijkstra_edge_t;

typedef struct {
	int node;
	int cost;
} dijkstra_node_t;

int dijkstra_edge_num;
dijkstra_edge_t dijkstra_edge[DIJKSTRA_MAX_EDGE];
int dijkstra_node_edge[DIJKSTRA_MAX_NODE][2];
int dijkstra_queue_num;
dijkstra_node_t dijkstra_queue[DIJKSTRA_MAX_EDGE+1];
int dijkstra_cost[DIJKSTRA_MAX_NODE];
char dijkstra_visited[DIJKSTRA_MAX_NODE];

int dijkstra_comp(const void* x,const void* y) {
	const dijkstra_edge_t* a=(const dijkstra_edge_t*)x;
	const dijkstra_edge_t* b=(const dijkstra_edge_t*)y;
	if((a->from)>(b->from))return 1;
	if((a->from)<(b->from))return -1;
	if((a->to)>(b->to))return 1;
	if((a->to)<(b->to))return -1;
	return 0;
}

void dijkstra_queue_adjust(int pos) {
	int min=pos;
	if(pos*2+1<dijkstra_queue_num &&
		dijkstra_queue[min].cost>dijkstra_queue[pos*2+1].cost)
			min=pos*2+1;
	if(pos*2+2<dijkstra_queue_num &&
		dijkstra_queue[min].cost>dijkstra_queue[pos*2+2].cost)
			min=pos*2+2;
	if(min!=pos) {
		dijkstra_node_t temp;
		temp=dijkstra_queue[min];
		dijkstra_queue[min]=dijkstra_queue[pos];
		dijkstra_queue[pos]=temp;
		dijkstra_queue_adjust(min);
	} else if(pos>0)dijkstra_queue_adjust((pos-1)/2);
}

void dijkstra_queue_push(int node,int cost) {
	dijkstra_node_t topush;
	topush.node=node;topush.cost=cost;
	dijkstra_queue[dijkstra_queue_num++]=topush;
	dijkstra_queue_adjust(dijkstra_queue_num-1);
}

dijkstra_node_t dijkstra_queue_pop(void) {
	dijkstra_node_t result=dijkstra_queue[0];
	if(dijkstra_queue_num>0) {
		dijkstra_queue[0]=dijkstra_queue[--dijkstra_queue_num];
		dijkstra_queue_adjust(0);
	}
	return result;
}

void dijkstra_init(void) {
	dijkstra_edge_num=0;
}

void dijkstra_addedge(int from,int to,int cost) {
	dijkstra_edge[dijkstra_edge_num].from=from;
	dijkstra_edge[dijkstra_edge_num].to=to;
	dijkstra_edge[dijkstra_edge_num].cost=cost;
	dijkstra_edge_num++;
}

void dijkstra_setup(void) {
	int i;
	int prev;
	qsort(dijkstra_edge,dijkstra_edge_num,
		sizeof(dijkstra_edge_t),dijkstra_comp);
	prev=0;
	memset(dijkstra_node_edge,0,sizeof(dijkstra_node_edge));
	dijkstra_node_edge[0][0]=0;
	for(i=0;i<dijkstra_edge_num;i++) {
		if(dijkstra_edge[i].from!=dijkstra_edge[prev].from) {
			dijkstra_node_edge[dijkstra_edge[prev].from][1]=i;
			dijkstra_node_edge[dijkstra_edge[i].from][0]=i;
			prev=i;
		}
	}
	dijkstra_node_edge[dijkstra_edge[prev].from][1]=i;
}

void dijkstra_search(const int* from,int from_num) {
	int i;
	memset(dijkstra_cost,0xFF,sizeof(dijkstra_cost));
	memset(dijkstra_visited,0,sizeof(dijkstra_visited));
	dijkstra_queue_num=0;
	for(i=0;i<from_num;i++)dijkstra_queue_push(from[i],0);
	while(dijkstra_queue_num>0) {
		dijkstra_node_t nownode=dijkstra_queue_pop();
		if(!dijkstra_visited[nownode.node]) {
			dijkstra_visited[nownode.node]=1;
			dijkstra_cost[nownode.node]=nownode.cost;
			for(i=dijkstra_node_edge[nownode.node][0];
					i<dijkstra_node_edge[nownode.node][1];i++) {
				if(!dijkstra_visited[dijkstra_edge[i].to]) {
					dijkstra_queue_push(
						dijkstra_edge[i].to,
						nownode.cost+dijkstra_edge[i].cost
					);
				}
			}
		}
	}
}

#define UNION_FIND_MAX 100000

int uf_table[UNION_FIND_MAX];

void uf_init(void) {
	int i;
	for(i=0;i<UNION_FIND_MAX;i++)uf_table[i]=0;
}

void uf_merge(int a,int b) {
	int next;
	while(uf_table[a]>0) {
		next=uf_table[a]-1;
		if(uf_table[next]>0)uf_table[a]=uf_table[next];
		a=next;
	}
	while(uf_table[b]>0) {
		next=uf_table[b]-1;
		if(uf_table[next]>0)uf_table[b]=uf_table[next];
		b=next;
	}
	if(a!=b)uf_table[a]=b+1;
}

int uf_issame(int a,int b) {
	int next;
	while(uf_table[a]>0) {
		next=uf_table[a]-1;
		if(uf_table[next]>0)uf_table[a]=uf_table[next];
		a=next;
	}
	while(uf_table[b]>0) {
		next=uf_table[b]-1;
		if(uf_table[next]>0)uf_table[b]=uf_table[next];
		b=next;
	}
	return a==b;
}

int mati_num;
int douro_num;
int omaturi_num;
int omaturi_list[100000];
int query_num;
dijkstra_edge_t douro[200000];
dijkstra_edge_t douro_use[200000];
int mati_douro[100000][2];
int tree_parent[100000];
int tree_depth[100000];
int lca_goto[18][100000];
int lca_cost[18][100000];

int edge_comp_cost(const void* x,const void* y) {
	const dijkstra_edge_t* a=(const dijkstra_edge_t*)x;
	const dijkstra_edge_t* b=(const dijkstra_edge_t*)y;
	if((a->cost)<(b->cost))return 1;
	if((a->cost)>(b->cost))return -1;
	return 0;
}

void make_tree(int now,int parent,int depth) {
	int i;
	tree_parent[now]=parent;
	tree_depth[now]=depth;
	for(i=mati_douro[now][0];i<mati_douro[now][1];i++) {
		if(douro_use[i].to!=parent) {
			make_tree(douro_use[i].to,now,depth+1);
		}
	}
}

void lca_setup(void) {
	int i,j;
	for(i=0;i<mati_num;i++) {
		lca_goto[0][i]=tree_parent[i];
		lca_cost[0][i]=dijkstra_cost[i];
		if(tree_parent[i]>=0 &&
				dijkstra_cost[tree_parent[i]]<dijkstra_cost[i]) {
			lca_cost[0][i]=dijkstra_cost[tree_parent[i]];
		}
	}
	for(i=1;i<18;i++) {
		for(j=0;j<mati_num;j++) {
			lca_goto[i][j]=lca_goto[i-1][lca_goto[i-1][j]];
			lca_cost[i][j]=lca_cost[i-1][j];
			if(lca_goto[i-1][j]>=0 &&
					lca_cost[i-1][lca_goto[i-1][j]]<lca_cost[i-1][j]) {
				lca_cost[i][j]=lca_cost[i-1][lca_goto[i-1][j]];
			}
		}
	}
}

int lca_go(int* cost,int start,int go) {
	int thecost=dijkstra_cost[start];
	int now=start;
	int i;
	for(i=0;i<18;i++) {
		if(go & (1<<i)) {
			if(lca_cost[i][now]<thecost)thecost=lca_cost[i][now];
			now=lca_goto[i][now];
		}
	}
	if(cost)*cost=thecost;
	return now;
}

int lca_query(int a,int b) {
	int thecost=0x7fffffff;
	int nextcost;
	int left,right,mid;
	if(a==b)return dijkstra_cost[a];
	if(tree_depth[a]>tree_depth[b]) {
		a=lca_go(&thecost,a,tree_depth[a]-tree_depth[b]);
	} else if(tree_depth[a]<tree_depth[b]) {
		b=lca_go(&thecost,b,tree_depth[b]-tree_depth[a]);
	}
	left=0;right=tree_depth[a]-1;
	while(left<=right) {
		mid=(left+right)/2;
		if(lca_go(NULL,a,mid)==lca_go(NULL,b,mid)) {
			right=mid-1;
		} else {
			left=mid+1;
		}
	}
	lca_go(&nextcost,a,right+1);
	if(nextcost<thecost)thecost=nextcost;
	lca_go(&nextcost,b,right+1);
	if(nextcost<thecost)thecost=nextcost;
	return thecost;
}

int main(void) {
	int i;
	int connect_count;
	int prev;
	scanf("%d%d%d%d",&mati_num,&douro_num,&omaturi_num,&query_num);
	/* dijkstra */
	dijkstra_init();
	for(i=0;i<douro_num;i++) {
		int a,b,c;
		scanf("%d%d%d",&a,&b,&c);
		a--;b--;
		dijkstra_addedge(a,b,c);
		dijkstra_addedge(b,a,c);
		douro[i].from=a;
		douro[i].to=b;
	}
	dijkstra_setup();
	for(i=0;i<omaturi_num;i++) {
		scanf("%d",&omaturi_list[i]);
		omaturi_list[i]--;
	}
	dijkstra_search(omaturi_list,omaturi_num);

	/* make tree */
	for(i=0;i<douro_num;i++) {
		if(dijkstra_cost[douro[i].from]<dijkstra_cost[douro[i].to]) {
			douro[i].cost=dijkstra_cost[douro[i].from];
		} else {
			douro[i].cost=dijkstra_cost[douro[i].to];
		}
	}
	qsort(douro,douro_num,sizeof(dijkstra_edge_t),edge_comp_cost);
	uf_init();
	connect_count=0;
	for(i=0;i<douro_num;i++) {
		if(!uf_issame(douro[i].from,douro[i].to)) {
			uf_merge(douro[i].from,douro[i].to);
			douro_use[connect_count*2].from=douro[i].from;
			douro_use[connect_count*2].to=douro[i].to;
			douro_use[connect_count*2].cost=douro[i].cost;
			douro_use[connect_count*2+1].from=douro[i].to;
			douro_use[connect_count*2+1].to=douro[i].from;
			douro_use[connect_count*2+1].cost=douro[i].cost;
			connect_count++;
		}
	}
	connect_count*=2;
	qsort(douro_use,connect_count,
		sizeof(dijkstra_edge_t),dijkstra_comp);
	prev=0;
	memset(mati_douro,0,sizeof(mati_douro));
	mati_douro[0][0]=0;
	for(i=0;i<connect_count;i++) {
		if(douro_use[i].from!=douro_use[prev].from) {
			mati_douro[douro_use[prev].from][1]=i;
			mati_douro[douro_use[i].from][0]=i;
			prev=i;
		}
	}
	mati_douro[douro_use[prev].from][1]=i;

	/* calculate query */
	make_tree(0,-1,1);
	lca_setup();
	for(i=0;i<query_num;i++) {
		int a,b;
		scanf("%d%d",&a,&b);
		a--;b--;
		printf("%d\n",lca_query(a,b));
	}

	return 0;
}