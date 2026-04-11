// AOJ 0343 Programming Contest II
// 2019.3.31 bal4u

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//#include <assert.h>

//// 高速入出力
#if 1
#define gc() getchar_unlocked()
#define pc(c) putchar_unlocked(c)
#else
#define gc() getchar()
#define pc(c) putchar(c)
#endif
int in()  // 非負整数の入力
{
	int n = 0, c = gc();
	do n = 10 * n + (c & 0xf), c = gc(); while (c >= '0');
	return n;
}

void out(long long n)  // 非負整数の表示（出力）
{
	int i;
	char ob[40];

	if (!n) pc('0');
	else {
		i = 0; while (n) ob[i++] = n % 10 + '0', n /= 10;
		while (i--) pc(ob[i]);
	}
}


//// 座標圧縮 ComPact
//   例: sz=5, val=[7,9,10000,2,9] -->　結果 res=[1,2,3,0,2]
//   圧縮後の最小値は0, 最大値はユニーク値の個数
typedef struct { int id; long long val; } CP;

// C言語標準装備のクイックソート用比較関数。整数(int)配列を昇順にソート
static int cp_cmp(const void *a, const void *b) {
	long long t = ((CP *)a)->val - ((CP *)b)->val;
	if (t < 0) return -1;
	return t > 0 ? 1 : 0;
}

// 座標圧縮の本体
// 　　圧縮後の新しいデータ、データ数、１次元データ配列
int compact(int *res, int sz, long long *a)
{
	int i, j;
	CP *memo;

	if ((memo = malloc(sizeof(CP)*sz)) == NULL) return 0;    // メモリ確保に失敗
	for (i = 0; i < sz; i++) memo[i].id = i, memo[i].val = a[i];
	qsort(memo, sz, sizeof(CP), cp_cmp);

	i = 0, j = 1;
	res[memo[0].id] = 0;
	while (1) {
		while (j < sz && memo[j].val == memo[i].val) res[memo[j++].id] = i;
		if (j >= sz) break;
		if (++i != j) memo[i].val = memo[j].val;
		res[memo[j++].id] = i;
	}
	free(memo);
	return i+1;    // 正常に終了時。圧縮後の最大値
}

//// fenwick_tree_set
#define MAXB 500000
int bit_n, bit_cnt;
int bit_data[MAXB];

int find(int p)
{
	int ans = 0;
	while (p > 0) ans += bit_data[p], p -= p & -p;
	return ans;
}

void add(int p, int x)
{
	p++;
	while (p <= bit_n) bit_data[p] += x, p += p & -p;
}

int size() { return bit_cnt; }
int count(int val) {            // valという数値の個数
//	assert(0 <= val && val < bit_n);
	return find(val + 1) - find(val);
}

void insert(int val) {
//	assert(0 <= val && val < bit_n);
	add(val, 1);
	bit_cnt++;
}

void erase(int val)
{
//	assert(0 <= val && val < bit_n);
//	assert(0 < count(val));
	add(val, -1);
	bit_cnt--;
}

int _clzsi2(unsigned x)
{
	unsigned y;
	int n = 32;
	y = x >> 16; if (y != 0) { n = n - 16; x = y; }
	y = x >> 8;  if (y != 0) { n = n - 8;  x = y; }
	y = x >> 4;  if (y != 0) { n = n - 4;  x = y; }
	y = x >> 2;  if (y != 0) { n = n - 2;  x = y; }
	y = x >> 1;  if (y != 0) return n - 2;
	return n - x;
}

int kth_element(int k) {        // 0番目から 0-index
//	assert(0 <= k && k < bit_cnt);
	int p = 1 << (32 - _clzsi2(bit_n)); //__builtin_clz(n): the number of leading 0-bits in n)
	int ans = 0;

	while (p >>= 1) {
		if (ans + p <= bit_n && bit_data[ans + p] <= k) {
			k -= bit_data[ans + p];
			ans += p;
		}
	}
	return ans;
};


//// 本問題関連
#define MAX 500000
#define SFT 17
#define MASK 0x1ffff  // 2^17-1

int N;                     // チーム数
long long last[100005];    // 各チームのポイントを記録

int cmd[100005]; int csz;  // 命令数
long long data[MAX]; int dsz;   // update命令を(チーム、ポイント）に変換
int  small[MAX];
long long s2d[MAX];        // 座標圧縮したデータをもとに対応させる

int main()
{
	int i, t, C, c;
	long long p;

	N = in(), C = in();
	for (i = 1; i <= N; i++) data[i-1] = N-i;
	csz = 0, dsz = N;
	for (i = 0; i < C; i++) {
		c = gc() & 1, gc();
		if (c == 0) {       // update
			t = in(), p = in();  // チーム番号, 追加ポイント
			cmd[csz++] = dsz;
			data[dsz++] = (last[t] << SFT) | (N-t);
			last[t] += p;
			data[dsz++] = (last[t] << SFT) | (N-t);
		}
		else {              // report
			cmd[csz++] = -in();  // チーム番号
		}
	}
	bit_n = dsz+10;
	compact(small, dsz, data);
	for (i = 0; i < dsz; i++) s2d[small[i]] = data[i];

	for (i = 0; i < N; i++) insert(small[i]);
	dsz = i; for (i = 0; i < csz; i++) {
		if (cmd[i] < 0) {
			p = s2d[kth_element(N + cmd[i])];
			out(N - (p & MASK)), pc(' '), out(p >> SFT), pc('\n');
		}
		else {
			erase(small[dsz++]);
			insert(small[dsz++]);
		}
	}
	return 0;
}
