#include <stdio.h>

// Helper function to print values of bits in number
void showbits(unsigned long x) {
    int i; 
    for(i=(sizeof(int)*8)-1; i>=0; i--)
            (x&(1u<<i))?putchar('1'):putchar('0');
    
    printf("\n");
}

unsigned long check_div_c(long a, long b, long c) {
    if(c == 0) {
        if(a % b == 0) {
            return 0;
        } else {
            return 1;
        }
    } else {
        unsigned long value = 0;
        for(int i = 1; i <= 32; i++) {
            if(a % i == 0) {
                value = (1 << i-1) | value;
            }
            // showbits(value);
        }
        return value;
    }
}

unsigned long check_div(long a, long b, long c);

int main(){
    long a  = 32;
    long b = 2;
    long c = 1;

    showbits(check_div_c(a, b, c));
    showbits(check_div(a, b, c));

    // printf("%lu\n", check_div_c(a, b, c));
	// printf("%lu\n", check_div(a, b, c));
}