// Project Euler, Problem 001, Swift
//
// If we list all the natural numbers below 10 that are multiples of 3 or 5, 
// we get 3, 5, 6 and 9. The sum of these multiples is 23.
// Find the sum of all the multiples of 3 or 5 below 1000.
//
// Answer: 233168

var finalSum:Int = 0

for i in 3..<1000
{
	if ((0 == i%3) || (0 == i%5))
	{
		finalSum += i
	}
}

print ("Final sum: \(finalSum)")