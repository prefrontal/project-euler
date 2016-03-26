// Project Euler Problem 47, Swift
//
// The first two consecutive numbers to have two distinct prime factors are:
// 
// 14 = 2 × 7
// 15 = 3 × 5
// 
// The first three consecutive numbers to have three distinct prime factors are:
// 
// 644 = 2² × 7 × 23
// 645 = 3 × 5 × 43
// 646 = 2 × 17 × 19.
// 
// Find the first four consecutive integers to have four distinct prime factors. 
// What is the first of these numbers?
//
// Answer: 134043

import Foundation

let TARGET_FACTOR_COUNT:Int = 4;
let TARGET_RUN_LENGTH:Int = 4;
let MAXIMUM_VALUE:Int = 150000;

/*
 * Sieve of Eratosthenes (integers)
 * Simple, ancient algorithm for finding all prime numbers up to any given limit.
 * It does so by iteratively marking as composite (i.e., not prime) the multiples
 * of each prime, starting with the multiples of 2.
 *
 * Provides a vector of integers that represent the prime numbers under the maximum value
*/
func GetPrimes (maximum:Int, inout _ primes:[Int])
{
	// Clear the input vector in case there is existing data
	primes = [Int]()
	
	// There are no primes less than 2
	if (maximum < 2)
	{
		return;
	}
	
	// Construct and execute the Sieve
	let sqrtMaximum:Int = Int( sqrt(Double(maximum)) );
	var primeTracker:[Bool] = [Bool](count:maximum, repeatedValue:true);
	
	for (var i:Int = 2; i < sqrtMaximum; ++i)
	{
		if (!primeTracker[i])
		{
			continue;
		}
		
		for (var j:Int = i + i; j < maximum; j += i)
		{
			if (j < 0)  // Guard against integer overflow
			{
				break;
			}
			
			primeTracker[j] = false;
		}
	}
	
	// Generate the list of primes to return
	for (var k:Int = 2; k < maximum; ++k)
	{
		if (primeTracker[k] == true)
		{
			primes.append (k);
		}
	}
}

/*
 * Get a list of the prime factors of a given integer
 * This function expects to have a valid list of primes passed in
 */
func GetPrimeFactors (number:Int, _ primes:[Int]) -> Int
{
	var factorCount:Int = 0;
	var lastFactor:Int = 0;
	var remainder:Int = number;
	
	// Keep looping until we reach the end of our dividing
	while (remainder != 1 )
	{
		// Determine the lowest prime that we can use to divide the remainder
		for (var i:Int = 0; i < primes.count; i++)
		{
			if (remainder <= 1) // Sanity check
			{
				break;
			}
			
			// Found a prime factor
			if (0 == remainder % primes[i])
			{
				// If the current factor is the same as
				// the last one then don't count it
				if (primes[i] != lastFactor)
				{
					factorCount++;
					lastFactor = primes[i];
				}
				
				remainder /= primes[i];
				break;
			}
		}
	}

	return factorCount;
}

// We are using brute force for the prime factor search
// This takes about sixteen seconds on my machine
// There are clearly some ways that we could speed this up

var primes:[Int] = [Int]()
GetPrimes (MAXIMUM_VALUE, &primes);

var leadValue:Int = 0;
var consecutivePrimeCount:Int = 0;

// Examine all integers up to the maximum value
// Start at one so we don't try to factor zero
for (var i:Int = 1; i < MAXIMUM_VALUE; i++)
{   
	var factorCount:Int = GetPrimeFactors (i, primes);
	
	// Reset the counter if we didn't get the right number of factors
	if (factorCount != TARGET_FACTOR_COUNT)
	{
		consecutivePrimeCount = 0;
		continue;
	}
	
	// If this is the first in a new potential sequence 
	// then keep track of the lead integer value
	if (consecutivePrimeCount == 0)
	{
		leadValue = i;
	}
	
	consecutivePrimeCount++;
	
	// Determine if we have found the target run
	if (consecutivePrimeCount == TARGET_RUN_LENGTH)
	{
		break;
	}
}

print ("The target integer is: \(leadValue)")
