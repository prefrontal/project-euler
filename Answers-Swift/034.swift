// Project Euler Problem 34, Swift
//
// 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
// 
// Find the sum of all numbers which are equal to the sum of the factorial of their digits.
// 
// Note: as 1! = 1 and 2! = 2 are not sums they are not included.
//
// Answer: 40730

import Foundation

// Recursively calculate factorial value of an integer
func factorial (x:Int) -> Int
{
	// Check for appropriate positive value
	if (x < 0)
	{
		return 0;   
	} 
	
	// Special case at a value of zero and one
	if ((x == 0) || (x == 1))
	{
		return 1;
	}
	
	// Calculate factorial
	if (x == 1) 
	{
		return x; 
	}

	return x * factorial (x - 1);
}

let MAXIMUM_VALUE:Int = 100000;

// Brute force search between 10 and a predefined maximum value

var finalSum:Int = 0;

for (var i:Int = 10; i < MAXIMUM_VALUE; i++)
{
	var temp:Int = i; 
	var factorialSum:Int = 0;   

	while (temp > 0)
	{
		factorialSum += factorial (temp % 10);
		temp /= 10;
	}
		
	if (i == factorialSum)
	{
		finalSum += i;
	}
}

print ("The final sum is: \(finalSum)")