// Project Euler Problem 35, Swift
//
// The number, 197, is called a circular prime because all rotations 
// of the digits: 197, 971, and 719, are themselves prime.
//
// There are thirteen such primes below 100: 
// 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
//
// How many circular primes are there below one million?
//
// Answer: 55

import Foundation

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
	let sqrtMaximum:Int = Int( sqrt(Double(maximum)) );
	var primeTracker:[Bool] = [Bool](count:maximum, repeatedValue:true)
					
	for (var i:Int = 2; i < sqrtMaximum; i++)
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

// Moves the first character in a string to the end of the string
// This rotates the number, which is useful when looking for circular primes
func RotateNumber (input:String) -> String
{
	let a = input.startIndex.advancedBy(1)
	let b = input.endIndex
	return input.substringWithRange(Range<String.Index>(start:a, end:b)) + String(input[input.startIndex])
}

let MAXIMUM_VALUE = 1000000;

// Find the number of circular primes between 2 and an upper bound

var primes:[Bool] = [Bool]()
GetPrimes (MAXIMUM_VALUE, &primes);

var primeCount:Int = 0;

for (var i:Int = 2; i < MAXIMUM_VALUE; i++)
{
	// Is this number prime?
	if (!primes[i])
	{
		continue;
	}
	
	// Convert number to string for permutation
	var stringValue = String(i)
	
	var isCircularPrime:Bool = true;
	
	// Determine if each rotation is prime
	for (var j:Int = 0; j < stringValue.characters.count; j++)
	{
		var permutationValue:Int = 0;
		permutationValue = Int(stringValue)!

		if (!primes[permutationValue])
		{
			isCircularPrime = false;
		}
			
		stringValue = RotateNumber (stringValue);
	}
	
	if (isCircularPrime)
	{
		primeCount++;
		print (i)
	}
}

print ("The count of circular primes is: \(primeCount)")
