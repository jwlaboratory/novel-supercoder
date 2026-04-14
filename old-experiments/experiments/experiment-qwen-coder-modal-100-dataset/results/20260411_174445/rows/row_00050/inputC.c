// AOJ 2173 Wind Passages
// 多角形間の最短距離（含まれる線分間や頂点間の最短距離）を求め、
// ダイクストラ法で最短距離の合計を算出すれば答えとなる。
// 2018.3.18 bal4u

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>


// 高速数値入出力
#if 1
#define gc() getchar_unlocked()
#else
#define gc() getchar()
#endif
int in()  // 非負整数のみ
{
	int n = 0, c = gc();
	do n = 10 * n + (c & 0xf), c = gc(); while (c >= '0');
	return n;
}


// 平面幾何関連
typedef struct { double x, y; } PP;
typedef struct { PP s, e; } SEG, LINE;
typedef struct { int n; PP p[50]; } POLY;   // 多角形に含まれる最大頂点 50

#define INF			1e8
#define EPS			1e-8
#define EQ(a,b)		(fabs((a)-(b))<EPS)
#define PPeQ(a,b)	(EQ(a.x,b.x)&&EQ(a.y,b.y))

PP vset(double x, double y) { PP r; r.x = x, r.y = y; return r; }
PP vadd(PP p1, PP p2) { PP r; r.x = p1.x + p2.x, r.y = p1.y + p2.y; return r; }
PP vsub(PP p1, PP p2) { PP r; r.x = p1.x - p2.x, r.y = p1.y - p2.y; return r; }
PP vsmul(PP p, double k) { PP r; r.x = p.x * k, r.y = p.y * k; return r; }
PP vmul(PP p1, PP p2) {
	PP r;
	r.x = p1.x * p2.x - p1.y * p2.y, r.y = p1.x * p2.y + p1.y * p2.x; return r;
}
double dist(PP p1, PP p2) { return hypot(p1.x - p2.x, p1.y - p2.y); }

// 点とライン間の距離
double disPP2Ln(PP p, SEG s, int *on)
{
	double us, ub;
	double xx, yy;
	double x = p.x, y = p.y;
	double sx = s.s.x, sy = s.s.y, ex = s.e.x, ey = s.e.y;

	us = (x - sx) * (ex - sx) + (y - sy) * (ey - sy);
	ub = (ex - sx) * (ex - sx) + (ey - sy) * (ey - sy);

	/* closest point falls within the line segment */
	*on = (EQ(us, 0) || us >= 0) && (EQ(us, ub) || us <= ub);

	if (EQ(us, 0))  xx = sx, yy = sy;
	else if (EQ(us, ub)) xx = ex, yy = ey;
	else {
		xx = sx + (ex - sx) * us / ub;
		yy = sy + (ey - sy) * us / ub;
	}
	return hypot(x - xx, y - yy);
}

// 線分間の距離
double disSeg2Seg(SEG s1, SEG s2)
{
	int on;
	double t, d = INF;
	t = disPP2Ln(s1.s, s2, &on); if (on && t < d) d = t;
	t = disPP2Ln(s1.e, s2, &on); if (on && t < d) d = t;
	t = disPP2Ln(s2.s, s1, &on); if (on && t < d) d = t;
	t = disPP2Ln(s2.e, s1, &on); if (on && t < d) d = t;
	t = dist(s1.s, s2.s); if (t < d) d = t;
	t = dist(s1.s, s2.e); if (t < d) d = t;
	t = dist(s1.e, s2.s); if (t < d) d = t;
	t = dist(s1.e, s2.e); if (t < d) d = t;
	return d;
}

// 多角形間の距離
double disPoly2Poly(POLY p1, POLY p2)
{
	int i, j;
	double t, d = INF;
	SEG s1, s2;

	for (i = 0; i < p1.n; i++) {
		s1.s = p1.p[i], s1.e = p1.p[i + 1];
		for (j = 0; j < p2.n; j++) {
			s2.s = p2.p[j], s2.e = p2.p[j + 1];
			t = disSeg2Seg(s1, s2); if (t < d) d = t;
		}
	}
	return d;
}


// 優先度付きキュー（ダイクストラ法に使用）
#define MAX 30000
typedef struct { int id; double t; } QUE;
QUE que[MAX]; int qsize;
int qmax;

#define PARENT(i) ((i)>>1)
#define LEFT(i)   ((i)<<1)
#define RIGHT(i)  (((i)<<1)+1)

void min_heapify(int i)
{
	int l, r, min;
	QUE qt;

	l = LEFT(i), r = RIGHT(i);
	if (l < qsize && que[l].t < que[i].t) min = l; else min = i;
	if (r < qsize && que[r].t < que[min].t) min = r;
	if (min != i) {
		qt = que[i], que[i] = que[min], que[min] = qt;
		min_heapify(min);
	}
}

void deq()
{
	que[0] = que[--qsize];
	min_heapify(0);
}

// id は多角形識別番号、t はその間の最短距離
void enq(int id, double t)
{
	int i, min;
	QUE qt;

	i = qsize++;  if (qsize > qmax) qmax = qsize;
	que[i].id = id, que[i].t = t;
	while (i > 0 && que[min = PARENT(i)].t > que[i].t) {
		qt = que[i], que[i] = que[min], que[min] = qt;
		i = min;
	}
}

int W, N;
POLY poly[205];
double dis[205][205];
char vis[205];

double dijkstra(int start, int goal)
{
	int i, s;
	double d;

	qsize = 0;
	memset(vis, 0, sizeof(vis));
	enq(start, 0);
	while (qsize) {
		s = que[0].id; d = que[0].t, deq();
		if (s == goal) return d;
		if (vis[s]) continue;
		vis[s] = 1;
		for (i = 0; i < N; i++) {
			if (i == s || vis[i]) continue;
			enq(i, d + dis[s][i]);
		}
	}
	return -1;
}

int main()
{
	int i, j, M;
	double dl, dr, x;

	while (W = in()) {
		N = in();
		for (i = 1; i <= N; i++) {
			M = in(), poly[i].n = M;
			for (j = 0; j < M; j++) poly[i].p[j].x = in(), poly[i].p[j].y = in();
			poly[i].p[M] = poly[i].p[0];
		}
		for (i = 1; i <= N; i++) {
			dl = INF, dr = 0;
			for (j = 0; j < poly[i].n; j++) {
				x = poly[i].p[j].x;
				if (x < dl) dl = x;
				if (x > dr) dr = x;
			}
			dis[0][i] = dis[i][0] = dl;
			dis[i][N + 1] = dis[N + 1][i] = W - dr;
		}
		dis[0][N + 1] = dis[N + 1][0] = W;
		for (i = 1; i <= N; i++) for (j = i+1; j <= N; j++)
			dis[i][j] = dis[j][i] = disPoly2Poly(poly[i], poly[j]);

		N += 2;
#if 0
		for (i = 0; i < N; i++) {
			printf("dis [%d] -> ", i);
			for (j = 0; j < N; j++) printf(" [%d]%lf,", j, dis[i][j]);
			printf("\n");
		}
#endif
		printf("%.20lf\n", dijkstra(0, N-1));
	}
	return 0;
}

