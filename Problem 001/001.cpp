#include <iostream>

// Project Euler, Problem 001
// Answer: 233168

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