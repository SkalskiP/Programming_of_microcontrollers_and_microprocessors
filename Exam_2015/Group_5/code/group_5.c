#include <stdio.h>

int sum_c(int a, int b) {
    int sum = 0;
    for(int i = a; i <= b; i++) {
        sum += i;
    }
    return sum;
}

int sum(int a, int b);

int main(){
    int a = 1;
    int b = 5;

    printf("%d\n", sum_c(a, b));
	printf("%d\n", sum(a, b));
}