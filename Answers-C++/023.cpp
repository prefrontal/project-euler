// Project Euler Problem 23
//
// A perfect number is a number for which the sum of its proper divisors is 
// exactly equal to the number. For example, the sum of the proper divisors of
// 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
//
// A number n is called deficient if the sum of its proper divisors is less 
// than n and it is called abundant if this sum exceeds n.
// 
// As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest 
// number that can be written as the sum of two abundant numbers is 24. By mathematical 
// analysis, it can be shown that all integers greater than 28123 can be written as 
// the sum of two abundant numbers. However, this upper limit cannot be reduced any 
// further by analysis even though it is known that the greatest number that cannot be 
// expressed as the sum of two abundant numbers is less than this limit.
// 
// Find the sum of all the positive integers which cannot be 
// written as the sum of two abundant numbers.
//
// Answer: 4179871
	
#include <iostream>
#include <vector>

namespace
{
	const int MAX_INTEGER = 28123;	
}

// Brute-force determination of numeric abundance
bool IsAbundant (const int value)
{
	std::vector<int> divisors;
	
	for (int i = 1; i < value; i++)
	{
		if (0 == value % i)
			divisors.push_back (i);
	}
	
	int divisorSum = 0;
	
	for (auto it = divisors.begin(); it < divisors.end(); it++)
		divisorSum += *it;	

	if (value < divisorSum)
		return true;
	else
		return false;
	
}

int main (int argc, char *argv[]) 
{
	std::vector<int> abundantNumbers;
	std::vector<bool> numberList (MAX_INTEGER, false);
	
	// First, generate a list of abundant numbers
	for (int i = 12; i < MAX_INTEGER; i++)
	{
		if (IsAbundant (i))
			abundantNumbers.push_back(i);
	}
	
	// Next, add each abundant number to every other possible
	// abundant number in the vector.
	for (int m = 0; m < abundantNumbers.size(); m++)
	{
		for (int n = 0; n < abundantNumbers.size(); n++)
		{
			int position = abundantNumbers[m] + abundantNumbers[n];
			numberList[position] = true;
		}	
	}
	
	// Go through the list of numbers that cannot be expressed as
	// two abundant numbers and generate the final sum.
	int finalSum = 0;
	
	for (int p = 1; p < numberList.size(); p++)
	{
		if (!numberList[p])
			finalSum += p;		
	}
	
	std::cout << "The final sum is: " << finalSum << std::endl;
}







