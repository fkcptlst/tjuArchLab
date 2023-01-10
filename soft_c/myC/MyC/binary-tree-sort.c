/**
 * @file main.c
 * @brief Binary Tree Sort -- N*Log_2(N)
 * @author Christopher Liu
 * @version 1.0
 * @date 2022-12-26
 */

#include "soc_io.h"

#define N 100
#define max_layer 8 // log_2(100) = 8

// 1 ~ 100
int a[N] = {81, 37, 64, 23, 38, 65, 56, 15, 8, 33, 85, 39, 71, 12, 77, 6, 82, 89, 80, 35, 100, 59, 73, 4, 61, 30, 74, 69, 13, 42, 68, 63, 9, 29, 47, 36, 99, 25, 21, 14, 60, 3, 2, 18, 26, 83, 53, 5, 43, 67, 88, 70, 76, 92, 94, 48, 34, 49, 66, 95, 78, 62, 32, 52, 16, 72, 27, 28, 22, 40, 84, 91, 96, 57, 87, 51, 98, 1, 10, 11, 24, 20, 19, 31, 7, 97, 50, 86, 79, 17, 75, 55, 93, 44, 58, 54, 45, 41, 90, 46};
int ans[N];
struct TREE{
	int l, r, x;
}tree[N];
int tree_cnt = 0;
int ans_cnt = 0;

int rson(int root){
	if(!tree[root].r) tree[root].r = ++tree_cnt;
	return tree[root].r;
}
int lson(int root){
	if(!tree[root].l) tree[root].l = ++tree_cnt;
	return tree[root].l;
}

/**
 * @brief insert into tree
 * 	1. lson < root < rson 
 * 	2. root initial = 0;
 *
 * @param x 	  -> data
 * @param root 	-> current node id
 */
void insert(int x, int root){
	if(!tree[root].x){
		tree[root].x = x;
		return;
	}
	if(tree[root].x < x) insert(x, rson(root));
	else insert(x, lson(root));
}

/**
 * @brief head-second method
 *
 * @param root
 */
void recover(int root){
	if(tree[root].l) recover(tree[root].l);
	ans[ans_cnt++] = tree[root].x;
	if(tree[root].r) recover(tree[root].r);
}

int main() {
	init();
	int flag = 0;

	int i;
	for(i = 0; i < N; ++i) insert(a[i], 0);
	recover(0);
	for(i = 0; i < N; i ++) {
		if(ans[i] != (i+1)){
			flag = 1;
			break;
		}
	}

	if(i != N) flag = 1;

	print_result(flag==0);

	return 0;
}
