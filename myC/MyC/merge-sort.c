#include "soc_io.h"

#define N 100

int a[N] = {81, 37, 64, 23, 38, 65, 56, 15, 8, 33, 85, 39, 71, 12, 77, 6, 82, 89, 80, 35, 0, 59, 73, 4, 61, 30, 74, 69, 13, 42, 68, 63, 9, 29, 47, 36, 99, 25, 21, 14, 60, 3, 2, 18, 26, 83, 53, 5, 43, 67, 88, 70, 76, 92, 94, 48, 34, 49, 66, 95, 78, 62, 32, 52, 16, 72, 27, 28, 22, 40, 84, 91, 96, 57, 87, 51, 98, 1, 10, 11, 24, 20, 19, 31, 7, 97, 50, 86, 79, 17, 75, 55, 93, 44, 58, 54, 45, 41, 90, 46};
int tmp[N];

/**
 * @brief Merge sort -- Recursive
 *
 * @param a 	-- array head
 * @param l 	-- left bound
 * @param r 	-- right bound
 */
void merge_sort(int *a, int l, int r) {
	if(l>=r) return;

	int mid = (l+r) >> 1;
	merge_sort(a, l, mid);
	merge_sort(a, mid+1, r);

	int i=l,j=mid+1,k=l;
	for(i=l,j=mid+1,k=l;i<=mid&&j<=r;) {
		if (a[i]<a[j]){
			tmp[k++] = a[i++];
		}else{
			tmp[k++] = a[j++];
		}
	}
	while(i<=mid) tmp[k++] = a[i++];
	while(j<=r) tmp[k++] = a[j++];

	for(k=l;k<=r;++k) a[k] = tmp[k];
	return;
}

int main() {
	init();
	int flag = 0;
	merge_sort(a, 0, N - 1);

	int i;
	for(i = 0; i < N; i ++) {
		if(a[i] != i){
			flag = 1;
			break;
		}
	}

	if(i != N) flag = 1;

	print_result(flag==0);

	return 0;
}
