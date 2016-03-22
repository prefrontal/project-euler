// Project Euler Problem 41, Swift
//
// We shall say that an n-digit number is pandigital if it makes 
// use of all the digits 1 to n exactly once. For example, 2143 
// is a 4-digit pandigital and is also prime.
//
// What is the largest n-digit pandigital prime that exists?
//
// Answer: 7652413

import Foundation

let MAXIMUM_VALUE = 987654321;	

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

// Determine if an integer is a pandigital number
func IsPandigital (n:Int, _ input:Int) -> Bool
{
	// Convert the integer to a string and sort
	let temp:String = String(String(input).characters.sort())
	
	// Create a sorted pandigital string that
	// has the same length as the input
	var target:String = ""
	for (var i:Int = 1; i <= n; i++)
	{
		target += String(i);
	}

	return (temp == target)
}

// Return the number of characters in an integer
func GetIntegerLength (input:Int) -> Int
{
	var length:Int = 0;
	var temp:Int = input;
	
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

var maxPandigital:Int = 0;

var primes:[Int] = [Int]()
GetPrimes (MAXIMUM_VALUE, &primes);

print ("Number of primes: \(primes.count)")

for it in primes
{
	var length:Int = GetIntegerLength (it);
	var isPandigital:Bool = IsPandigital (length, it);
	
	if (isPandigital && (it > maxPandigital))
	{
		maxPandigital = it;
	}
}

print ("The maximum pandigital is: \(maxPandigital)")