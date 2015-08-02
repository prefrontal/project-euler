// Project Euler, Problem 001
//
// If we list all the natural numbers below 10 that are multiples of 3 or 5, 
// we get 3, 5, 6 and 9. The sum of these multiples is 23.
// Find the sum of all the multiples of 3 or 5 below 1000.
// Answer: 233168

#include <iostream>

namespace
{
    // Input parameters
    int START_VALUE = 1;
    int UPPER_LIMIT = 1000;
}

int main (int argc, char *argv[]) 
{
	int sumTotal = 0;

	for (int i = START_VALUE; i < UPPER_LIMIT; i++)
	{
		if ((i % 3) == 0)
			sumTotal += i;
		else if ((i % 5) == 0)
			sumTotal += i;
	}
	
	std::cout << "Sum total: " << sumTotal << std::endl;
}