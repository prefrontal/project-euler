// Project Euler Problem 27, Swift
//
// Euler discovered the remarkable quadratic formula:
//
// n² + n + 41
// 
// It turns out that the formula will produce 40 primes for the consecutive 
// values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is 
// divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.
// 
// The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes for the 
// consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.
// 
// Considering quadratics of the form:
//
// n² + an + b, where |a| < 1000 and |b| < 1000
//
// where |n| is the modulus/absolute value of n
// e.g. |11| = 11 and |−4| = 4
// Find the product of the coefficients, a and b, for the quadratic expression that produces 
// the maximum number of primes for consecutive values of n, starting with n = 0.
//
// Answer: -59231

import Foundation

// This answer isn't terribly fast since it completes in five seconds
// Some additional math would likely optimize the routine, but
// the brute force approach works OK for now...

func IsPrime (testValue:Int) -> Bool
{
	// There are no primes less than 2
	if (testValue < 2)
	{
		return false;
	}
	
	var primeState:Bool = true;
	
	for (var i:Int = 2; i < testValue; ++i)
	{
		if ((testValue % i) == 0)
		{
			primeState = false;
		}
	}
	
	return primeState;
}

var maxA:Int = 0;
var maxB:Int = 0;
var maxPrimeCount:Int = 0;

for (var a:Int = -1000; a <= 1000; a++)
{
	for (var b:Int = -1000; b <= 1000; b++)
	{
		var hasConsecutivePrimes:Bool = true;
		var primeCount:Int = 0;
		var n:Int = 0;
		
		while (hasConsecutivePrimes)
		{
			var nextValue:Int = n*n + a*n + b;

			hasConsecutivePrimes = IsPrime (nextValue);
			
			if (hasConsecutivePrimes)
			{
				primeCount++;
			}
				
			n += 1;
		}
		
		if (primeCount > maxPrimeCount)
		{
			maxPrimeCount = primeCount;
			maxA = a;
			maxB = b;
		}
	}
}

print ("Greatest number of consecutive primes: \(maxPrimeCount)")
print ("The product of the coefficients was: \(maxA * maxB)")