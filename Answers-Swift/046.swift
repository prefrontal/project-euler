// Project Euler Problem 46, Swift
//
// It was proposed by Christian Goldbach that every odd composite 
// number can be written as the sum of a prime and twice a square.
// 
// 9 = 7 + 2×1^2
// 15 = 7 + 2×2^2
// 21 = 3 + 2×3^2
// 25 = 7 + 2×3^2
// 27 = 19 + 2×2^2
// 33 = 31 + 2×1^2
// 
// It turns out that the conjecture was false.
// 
// What is the smallest odd composite that cannot be written 
// as the sum of a prime and twice a square?
//
// Answer: 5777

import Foundation

let MAXIMUM_VALUE:Int = 10000;
let STARTING_VALUE:Int = 33;

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
 * Generate all primes up to a given maximum value
 */
func GetSquares (maximum:Int, inout _ squares:[Int])
{
	squares = [Int]()
	
	var index:Int = 0;
	
	while (index*index < maximum)
	{
		squares.append (index*index);
		index++;
	}
}

var lowestComposite:Int = 0;

var primes:[Int] = [Int]()
GetPrimes (MAXIMUM_VALUE, &primes);

var squares:[Int] = [Int]()
GetSquares (MAXIMUM_VALUE, &squares);

// Main loop evaluating odd composite numbers
// To keep things simple, we will not exclude prime numbers,
// which will always have a solution anyway as prime + 0^2
for (var i:Int = STARTING_VALUE; i < MAXIMUM_VALUE; i += 2)
{
	var hasNoSolution:Bool = true;
	
	// Loop iterating over primes
	for (var j:Int = 0; j < primes.count; j++)
	{
		// Break the loop if we have exceeded the number
		if (j > i)
		{
			break;
		}
		
		// Loop iterating over squares
		for (var k:Int = 0; k < squares.count; k++)
		{
			// Break the loop if we have exceeded the number
			if (k > i)
			{
				break;
			}
			
			if (i == primes[j] + 2*squares[k])
			{
				hasNoSolution = false;
			}
		}
	}
	
	// Have we found the target?
	if (hasNoSolution)
	{
		lowestComposite = i;
		break;
	}
}

print ("The lowest odd composite without a solution is: \(lowestComposite)")
