#include <stdio.h>

long long min_of_three_c( unsigned int a, unsigned int b, unsigned int c )
{
	long long min_val;

	if(a <= b) {
		min_val = a;	
	}
	else {
		min_val = b;
	}

	if(min_val >= c) {
		min_val = c;
	}
	
	return min_val;
}

long long min_of_three_a( unsigned int a, unsigned int b, unsigned int c );

void main( void )
{

	long long a = 10;
	long long b = 5;
	long long c = 15;

	printf( "Min val of %ld, %ld, %ld using C = %ld\n", a, b, c, min_of_three_c(a, b, c));
	printf( "Min val of %ld, %ld, %ld using Assembly = %ld\n", a, b, c, min_of_three_a(a, b, c));
}
