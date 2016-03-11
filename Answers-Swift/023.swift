// Project Euler Problem 23, Swift
//
// A perfect number is a number for which the sum of its proper divisors is 
// exactly equal to the number. For example, the sum of the proper divisors of
// 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
//
// A number n is called deficient if the sum of its proper divisors is less 
// than n and it is called abundant if this sum exceeds n.
// 
// As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest 
// number that can be written as the sum of two abundant numbers is 24. By mathematical 
// analysis, it can be shown that all integers greater than 28123 can be written as 
// the sum of two abundant numbers. However, this upper limit cannot be reduced any 
// further by analysis even though it is known that the greatest number that cannot be 
// expressed as the sum of two abundant numbers is less than this limit.
// 
// Find the sum of all the positive integers which cannot be 
// written as the sum of two abundant numbers.
//
// Answer: 4179871
	
// Brute-force determination of numeric abundance
func IsAbundant (value:Int) -> Bool
{
	var divisors:[Int] = [Int]()
	
	for (var i:Int = 1; i < value; i++)
	{
		if (0 == value % i)
		{
			divisors.append (i);
		}
	}
	
	var divisorSum:Int = 0;
	
	for divisor in divisors
	{
		divisorSum += divisor
	}

	if (value < divisorSum) {return true} else {return false}
}

let MAX_INTEGER = 28123;	

var abundantNumbers:[Int] = [Int]()
var numberList:[Bool] = [Bool](count:MAX_INTEGER, repeatedValue:false)

// First, generate a list of abundant numbers
for (var i:Int = 12; i < MAX_INTEGER; i++)
{
	if (IsAbundant (i))
	{
		abundantNumbers.append (i);
	}
}

// Next, add each abundant number to every other possible
// abundant number in the vector.
for (var m:Int = 0; m < abundantNumbers.count; m++)
{
	for (var n:Int = 0; n < abundantNumbers.count; n++)
	{
		var position:Int = abundantNumbers[m] + abundantNumbers[n];
		if (position < MAX_INTEGER)
		{
			numberList[position] = true
		}
	}	
}

// Go through the list of numbers that cannot be expressed as
// two abundant numbers and generate the final sum.
var finalSum:Int = 0;

for (var p:Int = 1; p < numberList.count; p++)
{
	if (!numberList[p])
	{
		finalSum += p;
	}	
}

print ("The final sum is: \(finalSum)")