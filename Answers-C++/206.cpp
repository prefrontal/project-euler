// Project Euler Problem 206
//
// Find the unique positive integer whose square 
// has the form 1_2_3_4_5_6_7_8_9_0,
// where each “_” is a single digit.
//
// Answer: 1389019170

#include <iostream>

// Current implementation takes about 90s to complete
// Could probably be optimized further

int main (int argc, char *argv[]) 
{
	// This should juuust fit in a long long integer
	long long result;

	// Starting point is approximate square root
	// of first possible number (1020304050607080900)
	long long base = 1010101010;
	
	// Keep going until we find the number or we overflow
	// the long long integer...
	while (true)
	{
		result = base * base;
		bool found = true;
		
		// Check every other digit in the number
		for (int i = 10; i > 0; i--)
		{
			if (result%10 != i%10)
				found = false;
			
			result /= 100;
		}
		
		if (found)
			break;
		
		base += 1;
	}
	
	std::cout << "The number is: " << base << std::endl;
	
}