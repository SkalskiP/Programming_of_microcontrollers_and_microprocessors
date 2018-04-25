#include <stdio.h>

long long add_three_numc( int a, int b, int c )
{
	return(a + b + c);
}

long long add_three_numa( int a, int b, int c );

void main( void )
{
	int a = 2;
	int b = 3;
	int c = 4;
	
   printf( "add_three_numc = %ld, add_three_numa = %ld\n", add_three_numc(a, b, c), add_three_numa(a, b, c) );
}
