// Project Euler Problem 26, Swift
//
// A unit fraction contains 1 in the numerator. The decimal representation of the 
// unit fractions with denominators 2 to 10 are given:
// 
// 1/2	= 	0.5
// 1/3	= 	0.(3)
// 1/4	= 	0.25
// 1/5	= 	0.2
// 1/6	= 	0.1(6)
// 1/7	= 	0.(142857)
// 1/8	= 	0.125
// 1/9	= 	0.(1)
// 1/10	= 	0.1
//
// Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. 
// It can be seen that 1/7 has a 6-digit recurring cycle.
//
// Find the value of d < 1000 for which 1/d contains the longest 
// recurring cycle in its decimal fraction part.
//
// Answer: 983

import Foundation

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
	var primeTracker:[Bool] = [Bool](count:maximum, repeatedValue:true)
	
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

// Calculate pow(a,b) mod n
// For this problem std::pow(a,b)%n will overflow
// This template function calculates iteratively, avoiding the overflow
// From: http://stackoverflow.com/questions/8496182/calculating-powa-b-mod-n
func modpow (var base:Int, var _ exp:Int, _ modulus:Int) -> Int
{
	base %= modulus;
	var result:Int = 1;
	
	while (exp > 0) 
	{
		if (Bool(exp & Int(1)))
		{
			result = (result * base) % modulus;
		}
		
		base = (base * base) % modulus;
		exp >>= 1;
	}
	
	return result;
}

// Determine the cycle length of the fraction
// By solving the discrete logarithm
func DetermineCycleLength (value:Int) -> Int
{
	for (var i:Int = 1; i <= value; i++)
	{
		let a:Int = modpow (10, i, value);
		
		if (a == 1)
		{
			return i;
		}
	}
	
	return 0;
}

let MAXIMUM_VALUE = 1000;

// We only need to look at prime values
var primes:[Int] = [Int]()
GetPrimes (MAXIMUM_VALUE, &primes);

var longestCycle:Int = 0;
var longestDenominator:Int = 0;

for prime in primes
{
	var cycleLength:Int = DetermineCycleLength (prime);

	if (cycleLength > longestCycle)
	{
		longestCycle = cycleLength;
		longestDenominator = prime;
	}
}

print ("The denominator with the longest cycle is: \(longestDenominator) with length: \(longestCycle)")