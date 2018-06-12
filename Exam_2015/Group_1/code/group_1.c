#include <stdio.h>

int greatest_c(int a, int b, int c) {
    int tmp;
    if(a >= b) {
        tmp = a;
    } else {
        tmp = b;
    }

    if(tmp >= c) {
        return tmp;
    } else {
        return c;
    }
}

int greatest(int a, int b, int c);

int main(){
    int a  = -48;
    int b = 18;
    int c = -50;

    printf("%d\n", greatest_c(a, b, c));
	printf("%d\n", greatest(a, b, c));
}