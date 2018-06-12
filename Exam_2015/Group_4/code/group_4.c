#include <stdio.h>

int range_c(int x, int a, int b, int c) {
    if(x < a) {
        return 0;
    } else if(x >= a && x < b) {
        return 1;
    } else if(x >= b && x < c) {
        return 2;
    } else if(x >= c) {
        return 3;
    } 
}

int range(int x, int a, int b, int c);

int main(){
    int x  = 10;
    int a = 18;
    int b = 50;
    int c = 100;

    printf("%d\n", range_c(x, a, b, c));
	printf("%d\n", range(x, a, b, c));
}