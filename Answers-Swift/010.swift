// Project Euler Problem 10, Swift
//
// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
// Find the sum of all the primes below two million.
//
// Answer: 142913828922

import Foundation

/*
 * Sieve of Eratosthenes
 * Simple, ancient algorithm for finding all prime numbers up to any given limit.
 * It does so by iteratively marking as composite (i.e., not prime) the multiples
 * of each prime, starting with the multiples of 2.
*/
func GetPrimes (maximum:Int, inout primes:[Int])
{
	// Clear the input vector in case there is existing data
	primes.removeAll()
	
	// There are no primes less than 2
	if (maximum < 2)
	{
		return;
	}
	
	// Construct and execute the Sieve
	let sqrtMaximum = Int(sqrt(Double(maximum)))
	var primeTracker = [Bool](count:maximum, repeatedValue: true)
	
	for (var i = 2; i < sqrtMaximum; ++i)
	{
		if (!primeTracker[i])
		{
			continue
		}
		
		for (var j = i + i; j < maximum; j += i)
		{
			if (j < 0)  // Guard against integer overflow
			{
				break
			}
			
			primeTracker[j] = false
		}
	}
	
	// Generate the list of primes to return
	for (var k = 2; k < maximum; ++k)
	{
		if (primeTracker[k] == true)
		{
			primes.append (k)
		}
	}
}

/*
 * Find the sume of all primes up to a given number
 */

let TARGET_NUMBER = 2000000

var myPrimes = [Int]()
GetPrimes (TARGET_NUMBER, primes:&myPrimes)

var primeSum:Int64 = 0

for prime in myPrimes
{
	primeSum += prime
}
	
print ("The sum is: \(primeSum)")