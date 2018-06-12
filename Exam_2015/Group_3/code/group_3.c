#include <stdio.h>

int is_outside_c(int x, int a, int b) {
    int max;
    int min;

    if (a >= b) {
        max = a;
        min = b;
    } else {
        min = a;
        max = b;
    }

    if (x > max) {
        return 1;
    } else if (x < min) {
        return -1;
    } else {
        return 0;
    }

}

int is_outside(int x, int a, int b);

int main(){
    int x  = 10;
    int a = 18;
    int b = 50;

    printf("%d\n", is_outside_c(x, a, b));
	printf("%d\n", is_outside(x, a, b));
}