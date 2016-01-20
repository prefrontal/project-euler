// Project Euler Problem 5, Swift
//
// 2520 is the smallest number that can be divided by each of the numbers
// from 1 to 10 without any remainder. What is the smallest positive number 
// that is evenly divisible by all of the numbers from 1 to 20?
//
// Answer: 232792560

/*
 * Checks to see if a number is evenly divisible by all numbers between
 * zero and a specified maximum divisor.
 */
func IsEvenlyDivisible (value:Int) -> Bool
{
	if (value < MAX_DIVISOR)
	{
		return false
	}
	
	var evenlyDivisible = true;
	
	for var i = MAX_DIVISOR; i > 0; --i
	{
		if (0 != (value % i))
		{
			evenlyDivisible = false
			break
		}
	}
		
	return evenlyDivisible
}

let MAX_DIVISOR = 20

var currentValue = MAX_DIVISOR

while (true)
{
	++currentValue
	
	if (IsEvenlyDivisible(currentValue))
	{
		break
	}
}

print ("Smallest positive evenly divisible number: \(currentValue)")