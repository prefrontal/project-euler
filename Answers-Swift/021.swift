// Project Euler Problem 21, Swift
//
// Let d(n) be defined as the sum of proper divisors of n 
// (numbers less than n which divide evenly into n).
//
// If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable 
// pair and each of a and b are called amicable numbers.
//
// For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; 
// therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
// 
// Evaluate the sum of all the amicable numbers under 10000.
//
// Answer: 31626
	
import Foundation

let UPPER_LIMIT = 10000;	

// Brute force amicable number finder
func FindAmicableNumbers (limit:Int) -> [Bool]
{
	// We will use a vector of bools to track which numbers are amicable
	// This makes it much more straightforward to mark both numbers in the pair
	// Also, add one to the limit so our indices equal the actual number
	var numberTracker:[Bool] = [Bool](count:(limit+1), repeatedValue:false)
	
	for (var i:Int = 2; i <= UPPER_LIMIT; i++)
	{
		var firstDivisorSum:Int = 0;
		
		// Find the sum of the proper divisors
		for (var j:Int = 1; j < i; j++)
		{
			if (0 == (i%j))
			{
				firstDivisorSum += j;
			}
		}
		
		var secondDivisorSum:Int = 0;
		
		// Find the sum of the proper divisors for
		// the result of our previous loop
		for (var k:Int = 1; k < firstDivisorSum; k++)
		{
			if (0 == (firstDivisorSum%k))
			{
				secondDivisorSum += k;
			}
		}
		
		// Determine if amicable and track
		if ((secondDivisorSum == i) && (i != firstDivisorSum))
		{
			numberTracker[i] = true;
			numberTracker[firstDivisorSum] = true;
			
			print ("Amicable pair: * \(i) * \(firstDivisorSum) *")
		}
		
	}
	
	return numberTracker;
}

var amicableNumbers:[Bool] = FindAmicableNumbers (UPPER_LIMIT);
var amicableSum:Int = 0;

// Find the sum of the amicable numbers
for (var i:Int = 1; i <= UPPER_LIMIT; i++)
{
	if (amicableNumbers[i])
	{
		amicableSum += i;
	}
}

print ("The sum is: \(amicableSum)")