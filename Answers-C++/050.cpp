// Project Euler Problem 50
//
// The prime 41, can be written as the sum of six consecutive primes:
//
// 41 = 2 + 3 + 5 + 7 + 11 + 13
// 
// This is the longest sum of consecutive primes that adds to a prime below one-hundred.
// 
// The longest sum of consecutive primes below one-thousand that 
// adds to a prime, contains 21 terms, and is equal to 953.
// 
// Which prime, below one-million, can be written as the sum of the most consecutive primes?
// 
// Answer: 997651

#include <cmath>
#include <iostream>
#include <vector>

namespace
{
	const int MAXIMUM_VALUE = 1000000;	
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

// This answer is computationally inefficient. Since we work backward over the primes
// array we actually find the answer within a few seconds. However, it takes a significant
// amount of time to go through the entire primes array to know the definitive answer.
// This could/should be reworked with a another strategy that is more optimal.

int main (int argc, char *argv[]) 
{
    std::vector<int> primes;
	GetPrimes (MAXIMUM_VALUE, primes);
	
	// For loop efficieny, cache the size
	int numPrimes = primes.size();
	
	int maxPrimeCount = 0;
	int maxPrime = 0;
	
	// Loop over all primes in the vector in reverse since we assume
	// our target is a value closer to the top value than the bottom
	for (int i = numPrimes-1; i >= 0; i--)
	{
		// This loop defines the starting point for 
		// calculating the consecutive sums
		for (int j = 0; j < numPrimes; j++)
		{
			int primeCount = 0;
			int primeSum = 0;
			
			// Calculate the consecutive prime sum
			while (primeSum < primes[i])
			{
				if (j+primeCount >= numPrimes)
					break;
					
				primeSum += primes[j+primeCount];
				primeCount++;
			}
				
		    // Count it if we hit the prime exactly and have the highest count
			if ((primeSum == primes[i]) && (primeCount > maxPrimeCount))
			{
				maxPrime = primes[i];
				maxPrimeCount = primeCount;
			}
		}
	}
	
	std::cout << "The target prime is: " << maxPrime << std::endl;
}