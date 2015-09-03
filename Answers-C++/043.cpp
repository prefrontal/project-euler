// Project Euler Problem 43
//
// The number, 1406357289, is a 0 to 9 pandigital number because it is made up of 
// each of the digits 0 to 9 in some order, but it also has a rather 
// interesting sub-string divisibility property.
// 
// Let d1 be the 1st digit, d2 be the 2nd digit, and so on. 
// In this way, we note the following:
// 
// d2d3d4=406 is divisible by 2
// d3d4d5=063 is divisible by 3
// d4d5d6=635 is divisible by 5
// d5d6d7=357 is divisible by 7
// d6d7d8=572 is divisible by 11
// d7d8d9=728 is divisible by 13
// d8d9d10=289 is divisible by 17
//
// Find the sum of all 0 to 9 pandigital numbers with this property.
//
// Answer: 
// 16695334890

#include <algorithm>
#include <iostream>
#include <sstream>

bool IsTargetPandigital (const std::string number)
{
	int divisors[] = {2, 3, 5, 7, 11, 13, 17};
	
	for (int i = 0; i <= 6; i++)
	{
		// We start counting at 0 in the loop,
		// but the problem indices begin at one
		std::stringstream a (number.substr(i+1, 3));
		long long value;
		a >> value;
		
		// Check the next divisor in the array
		if ((value % divisors[i]) != 0)
			return false;
	}

	return true;
}

int main (int argc, char *argv[]) 
{
	long long pandigitalSum = 0;
    std::string number = "0123456789";

	// We will permute the characters in the number string,
	// checking if each permutation is a pandigital target
	do
	{
		if (IsTargetPandigital(number))
		{
			std::stringstream a (number);
			long long value;
			a >> value;
			pandigitalSum += value;
		}
		
	}
	while (std::next_permutation(number.begin(), number.end()));
	
	std::cout << "The sum of pandigital numbers is: " << pandigitalSum << std::endl;
}