#include <stdio.h>

// Helper function to print values of bits in number
void showbits(long x) {
    int i; 
    for(i=(sizeof(int)*8)-1; i>=0; i--)
            (x&(1u<<i))?putchar('1'):putchar('0');
    
    printf("\n");
}

long check_tab_c (int * tab, int n, int* max) {
    int arr[32] = {0};
    int max_value = 0;
    int max_value_count = 0;
    long value = 0;

    for(int i = 0; i < n; i++) {
        value = (1 << tab[i]) | value;
        arr[tab[i]]++;
    }

    for(int i = 0; i < n; i++) {
        if(max_value_count <= arr[i]) {
            max_value = i;
            max_value_count = arr[i];
        }
    }

    *max = max_value_count;
    return value;
}

long check_tab (int * tab, int n, int* max);

int main(){
	int max_c;
    int max;
	int tab [] = {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2};
	int n = 15;

    showbits(check_tab_c(tab, n, &max_c));
    printf("%d\n", max_c);

    showbits(check_tab(tab, n, &max));
    printf("%d\n", max);
}