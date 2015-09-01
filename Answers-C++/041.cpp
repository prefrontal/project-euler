// Project Euler Problem 41
//
// We shall say that an n-digit number is pandigital if it makes 
// use of all the digits 1 to n exactly once. For example, 2143 
// is a 4-digit pandigital and is also prime.
//
// What is the largest n-digit pandigital prime that exists?
//
// Answer: 7652413

#include <cmath>
#include <iostream>
#include <sstream>
#include <vector>

namespace
{
	const int MAXIMUM_VALUE = 987654321;	
}

/*
 * Sieve of Eratosthenes (integers)
 * Simple, ancient algorithm for finding all prime numbers up to any given limit.
 * It does so by iteratively marking as composite (i.e., not prime) the multiples
 * of each prime, starting with the multiples of 2.
 *
 * Provides a vector of integers that represent the prime numbers under the maximum value
*/
void GetPrimes (const int maximum, std::vector<int> &primes)
{
	// Clear the input vector in case there is existing data
	primes.clear();
	
	// There are no primes less than 2
	if (maximum < 2)
		return;
	
	// Construct and execute the Sieve
	const int sqrtMaximum = static_cast<int>( sqrt(static_cast<double>(maximum)) );
	std::vector<bool> primeTracker (maximum, true);
	
	for (int i = 2; i < sqrtMaximum; ++i)
	{
		if (!primeTracker[i])
			continue;
		
		for (int j = i + i; j < maximum; j += i)
		{
			if (j < 0)  // Guard against integer overflow
				break;
			
			primeTracker[j] = false;
		}
	}
	
	// Generate the list of primes to return
	for (int k = 2; k < maximum; ++k)
	{
		if (primeTracker[k] == true)
			primes.push_back (k);
	}
}

// Determine if an integer is a pandigital number
bool IsPandigital (const int n, const int input)
{
	// Convert the integer to a string and sort
	std::stringstream a;
	a << input;
	std::string temp = a.str();
	std::sort (temp.begin(), temp.end());
	
	// Create a sorted pandigital string that
	// has the same length as the input
	std::stringstream target;
	for (int i = 1; i <= n; i++)
		target << i;
	
	// Determine pandigitality
	if (0 == temp.compare (target.str()))
		return true;
	else
		return false;
}

// Return the number of characters in an integer
int GetIntegerLength (const int input)
{
	int length = 0;
	int temp = input;
	
	while (temp > 0)
	{
		temp /= 10;
		length++;
	}
	
	return length;
}

// Determine the largest pandigital prime
// This isn't the most optimal solution since it takes about three
// minutes to get the final answer. I am sure it could be optimized.
int main (int argc, char *argv[]) 
{
	int maxPandigital = 0;
	
	std::vector<int> primes;
	GetPrimes (MAXIMUM_VALUE, primes);
	
	std::cout << "Number of primes: " << primes.size() << std::endl;
	
	for (auto it = primes.begin(); it < primes.end(); it++)
	{
		int length = GetIntegerLength (*it);
		bool isPandigital = IsPandigital (length, *it);
		
		if (isPandigital && (*it > maxPandigital))
			maxPandigital = *it;
	}
	
    std::cout << "The maximum pandigital is: " << maxPandigital << std::endl;
}