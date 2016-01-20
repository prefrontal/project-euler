// Project Euler, Problem 003, Swift
//
// The prime factors of 13195 are 5, 7, 13 and 29.
// What is the largest prime factor of the number 600851475143 ?
//
// Answer: 6857

import Foundation

var TARGET_NUMBER:Int64 = 600851475143;

func IsPrime (input:Int64) -> Bool
{
	if (input < 2)
	{
		return false
	}
	
	var primeState = true
	
	for var i:Int64 = 2; i < input; i++
	{
		if ((input % i) == 0)
		{
			primeState = false
			break
		}
	}
	
	return primeState;
}

func DetermineLargestPrimeFactor (inputValue:Int64) -> Int64
{
	var largestFactor:Int64 = 0
	let sqrtInput:Int64 = Int64(sqrt(Double(inputValue)))

	for var i:Int64 = 3; i < sqrtInput; i += 2
	{
		if ((inputValue % i) == 0)
		{
			if (IsPrime(i))
			{
				 if (i > largestFactor)
				{
					largestFactor = i;
				} 
			}     
		}      
	}
	
	return largestFactor
}

var factor:Int64 = DetermineLargestPrimeFactor (TARGET_NUMBER)

print ("Largest prime factor: \(factor)")

