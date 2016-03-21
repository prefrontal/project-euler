// Project Euler Problem 37, Swift
//
// The number 3797 has an interesting property. Being prime itself, 
// it is possible to continuously remove digits from left to right, 
// and remain prime at each stage: 3797, 797, 97, and 7. Similarly 
// we can work from right to left: 3797, 379, 37, and 3.
//
// Find the sum of the only eleven primes that are both 
// truncatable from left to right and right to left.
//
// NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
//
// Answer: 748317

import Foundation

let MAXIMUM_VALUE:Int = 1000000;
let LOWER_PRIME_LIMIT:Int = 7;

/*
 * Sieve of Eratosthenes
 * Simple, ancient algorithm for finding all prime numbers up to any given limit.
 * It does so by iteratively marking as composite (i.e., not prime) the multiples
 * of each prime, starting with the multiples of 2.
*/
func GetPrimes (maximum:Int, inout _ primes:[Bool])
{
	// Clear the input vector in case there is existing data
	primes = [Bool]()
	
	// There are no primes less than 2
	if (maximum < 2)
	{
		return;
	}
	
	// Construct and execute the Sieve
	let sqrtMaximum = Int( sqrt(Double(maximum)) );
	var primeTracker:[Bool] = [Bool](count:maximum, repeatedValue:true)
	
	// Block out the low numbers
	primeTracker[0] = false;
	primeTracker[1] = false;
	
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
	
	// For this answer, just return the tracking array instead of the numbers
	// We need to do a lot of lookups and the tracking array increases speed
	// relative to doing a ton of find operations on a vector.
	primes = primeTracker;
}

// Determine if a number is a truncateable prime number
// Pass in a vector of boolean values representing prime numbers
// This dramatically speeds things up instead of recalculating
func IsTruncateablePrime (value:Int, _ primes:[Bool]) -> Bool
{
	if (value <= LOWER_PRIME_LIMIT)
	{
		return false;
	}
	
	// Truncate the number from right
	// Just start chopping off digits using a modulo
	// operation until there is nothing left
	var right:Int = value;
	
	while (right > 0)
	{
		if (!primes[right])
		{
			return false;
		}
		
		right /= 10;
	}

	// Truncate the number from left
	// Instead of determining length, just start with modulo the 
	// maximum possible value and begin working down from there
	var left:Int = value;
	
	for (var j:Int = MAXIMUM_VALUE; j >= 10; j /= 10)
	{
		left = left % j;
		
		if (!primes[left])
		{
			return false;  
		}   
	}

	return true;
}

var primes:[Bool] = [Bool]()
GetPrimes (MAXIMUM_VALUE, &primes);

var finalSum:Int = 0;

for (var i:Int = LOWER_PRIME_LIMIT; i < primes.count; i++)
{
	if (!primes[i])
	{
		continue;
	}
	
	if (IsTruncateablePrime (i, primes))
	{
		finalSum += i;
	}
}

print ("The final sum is: \(finalSum)")