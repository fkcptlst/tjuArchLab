#include "soc_io.h"

#define N 100

int ans[N];

// -------------------------------------------- Map Definition Start --------------------------------------- //
#define MAX_DIS 0x3f3f3f3f
struct distance{
	int idx, dis; // idx -> to, dis -> distance
};
struct Edge{
	int from, to, dis;
	int nxt;
}edge[N<<1];
int head[N], cnt=1;

void initAns(){                                                                                                                                                                         
	int i=0;
	for(i=0;i<N;++i) ans[i] = MAX_DIS;
}

/**
 * @brief Add Edge to List
 *
 * @param from 	-> u
 * @param to 	-> v
 * @param dis 	-> distance
 */
void addEdge(int from, int to, int dis){
	edge[cnt].from = from;
	edge[cnt].to = to;
	edge[cnt].dis = dis;
	edge[cnt].nxt = head[from];
	head[from] = cnt;
	cnt ++;
	return ;
}
// -------------------------------------------- Map Definition End --------------------------------------- //

// -------------------------------------------- HEAP Definition start --------------------------------------- //
// Heap Definition
/*
 *          0
 * 	       /  \
 * 	      1    2
 * 	     / \  / \ 
 * 	    3  4 5   6	
 */
#define ParentId(x) ((x-1)>>1)
#define LId(x) ((x<<1)|1)
#define RId(x) ((x<<1)+2)
struct Heap{
	struct distance array[N]; 	// data
	int size; 			// Current Size
	int capacity; 			// = N
}heap;

struct distance getMin(struct Heap * h){
	return h->array[0];
}

void initHeap(struct Heap* h){
	int i=0;
	h->capacity = N;
	h->size = 0;
	for(i=0;i<N;++i) {
		h->array[i].dis = 0;
		h->array[i].idx = 0;
	}
}

/**
 * @brief push in the data 
 *
 * @param h 	-> Heap*
 * @param data 	-> distance
 *
 * @return 
 */
struct Heap* push(struct Heap* h, struct distance data){
	if(h->size == h->capacity) {
		// Error Alert
		return h;
	}
	h->array[h->size++] = data;
	int current = h->size - 1;
	while(current > 0 && h->array[ParentId(current)].dis > h->array[current].dis) {
		struct distance tmp = h->array[ParentId(current)];
		h->array[ParentId(current)] = h->array[current];
		h->array[current] = tmp;
		current = ParentId(current);
	}
	return h;
}

struct Heap* heapify(struct Heap* h, int idx){
	if(h->size <= 1) return h;
	int l = LId(idx), r = RId(idx);
	int mini = idx;
	if(l < h->size && h->array[l].dis < h->array[idx].dis) mini = l;
	if(r < h->size && h->array[r].dis < h->array[idx].dis) mini = r;
	if(mini != idx){
		struct distance tmp = h->array[idx];
		h->array[idx] = h->array[mini];
		h->array[mini] = tmp;
		h = heapify(h, mini);
	}
	return h;
}

/**
 * @brief pop the data with the minimum distance 
 *
 * @param h 	-> Heap *
 * @param data 	-> distance *
 *
 * @return 
 */
struct Heap* pop(struct Heap* h, struct distance * data){
	if(h->size==0){
		// Cannot Pop
		return h;
	}
	*data = h->array[0];
	h->array[0] = h->array[--h->size];
	h = heapify(h, 0);
	return h;
}

int empty(struct Heap* h){
	return h->size == 0;
}
// -------------------------------------------- HEAP Definition end --------------------------------------- //

// -------------------------------------------- Algorithm: Dijkstra start --------------------------------------- //
/**
 * @brief Dijkstra:
 * 	* find the minimum distance from 0 to every point it can reach
 *
 * @param start -> start point
 */
void Dijkstra(int start){
	int v;
	struct distance init;
	init.dis = 0, init.idx = start;
	ans[start] = 0;
	push(&heap, init);
	while(!empty(&heap)){
		struct distance curr_data;
		pop(&heap, &curr_data);
		if(curr_data.dis > ans[curr_data.idx]) continue;
		int d = curr_data.dis, u = curr_data.idx;
		// printf("from %d to %d : %d\n",start,u,d);
		int i;
		for(i=head[u];i;i=edge[i].nxt){
			v = edge[i].to;
			// printf(" Inner For: %d to %d : %d -> ",u,v,edge[i].dis);
			if(ans[v] > d + edge[i].dis) {
				ans[v] = d + edge[i].dis;
				struct distance node;
				node.dis = ans[v]; 
				node.idx = v;
				push(&heap, node);
			}
		}
    // printf("\n");
	}
}
// -------------------------------------------- Algorithm: Dijkstra end --------------------------------------- //

int tree_cnt = 0;
int ans_cnt = 0;


/**
 * @brief call addEdge to draw Map:
 *  
 *    ┌─┐  1  ┌─┐  8  ┌─┐       Start = 1:
 *    │1├────►│2├────►│3│◄─┐      Dis[1] = 0
 *    └┬┘     └─┘     └┬┘  │      Dis[2] = 1
 *     │       ▲       │   │      Dis[3] = 8
 *     │       │2      │10 │3     Dis[4] = 3
 *     │       ▼       ▼   │      Dis[5] = 5
 *     │4     ┌─┐  2  ┌─┐  │
 *     └─────►│4├────►│5│──┘
 *            └─┘     └─┘
 */
void drawMap(){
	addEdge(1, 2, 1);
	addEdge(1, 4, 4);
	addEdge(2, 3, 8);
	addEdge(2, 4, 2);
	addEdge(3, 5, 10);
	addEdge(4, 2, 2);
	addEdge(4, 5, 2);
	addEdge(5, 3, 3);
}
int real[] = { 0, 0, 1, 8, 3, 5};   // start from 1, no Point 0
#define START_NODE 1
#define LAST_NODE 5

int main() {
	init();

	int flag = 0;
	int i;

	drawMap();
	initAns();
	initHeap(&heap);
	Dijkstra(1);

	// for(i=0;i<=5;i++) printf("ans[%d]: %d -> " ,i, ans[i]);
	// printf("\n");

	for(i = START_NODE; i <= LAST_NODE; i ++) {
    // printf("%d vs %d\n", ans[i], real[i]);
		if(ans[i] != real[i]){
			flag = 1;
			break;
		}
	}

	print_result(flag==0);

	return 0;
}
