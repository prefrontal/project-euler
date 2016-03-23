// Project Euler Problem 43, Swift
//
// The number, 1406357289, is a 0 to 9 pandigital number because it is made up of 
// each of the digits 0 to 9 in some order, but it also has a rather 
// interesting sub-string divisibility property.
// 
// Let d1 be the 1st digit, d2 be the 2nd digit, and so on. 
// In this way, we note the following:
// 
// d2d3d4=406 is divisible by 2
// d3d4d5=063 is divisible by 3
// d4d5d6=635 is divisible by 5
// d5d6d7=357 is divisible by 7
// d6d7d8=572 is divisible by 11
// d7d8d9=728 is divisible by 13
// d8d9d10=289 is divisible by 17
//
// Find the sum of all 0 to 9 pandigital numbers with this property.
//
// Answer: 
// 16695334890

import Foundation

// Computes the next lexicographical permutation of the specified
// array of numbers in place, returning whether a next permutation
// existed. (Returns false when the argument is already the last
// possible permutation.)
//
// https://www.nayuki.io/page/next-lexicographical-permutation-algorithm
//
func nextPermutation (inout sequence:String) -> Bool
{
	var array = Array(sequence.characters)
	
	// Find non-increasing suffix
	var i = array.count - 1;
	
	while (i > 0 && array[i - 1] >= array[i])
	{
		i--;
	}
		
	if (i <= 0)
	{
		sequence = String(array)
		return false;
	}
	
	// Find successor to pivot
	var j = array.count - 1;
	
	while (array[j] <= array[i - 1])
	{
		j--;
	}
	
	var temp = array[i - 1];
	array[i - 1] = array[j];
	array[j] = temp;

	// Reverse suffix
	j = array.count - 1;
	
	while (i < j) 
	{
		temp = array[i];
		array[i] = array[j];
		array[j] = temp;
		i++;
		j--;
	}
	
	sequence = String(array)
	return true;
}

func IsTargetPandigital (number:String) -> Bool
{
	var divisors:[Int] = [2, 3, 5, 7, 11, 13, 17]
	
	for (var i:Int = 0; i <= 6; i++)
	{
		// We start counting at 0 in the loop,
		// but the problem indices begin at one
		// std::stringstream a (number.substr(i+1, 3));

		let range = number.startIndex.advancedBy(i+1)..<number.startIndex.advancedBy(i+4)
		let substring:String = number.substringWithRange(range)
		let value:Int64 = Int64(substring)!
		
		// Check the next divisor in the array
		if ((value % Int64(divisors[i])) != 0)
		{
			return false;
		}
	}

	return true;
}

var pandigitalSum:Int64 = 0;
var number:String = "0123456789"

// We will permute the characters in the number string,
// checking if each permutation is a pandigital target
repeat
{
	if (IsTargetPandigital(number))
	{
		var value:Int64 = Int64(number)!	
		pandigitalSum += value;
	}
	
}
while (nextPermutation (&number));

print ("The sum of pandigital numbers is: \(pandigitalSum)")