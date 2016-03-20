// Project Euler Problem 36, Swift
//
// The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
//
// Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
// 
// (Please note that the palindromic number, in either base, may not include leading zeros.)
//
// Answer: 872187

import Foundation

/*
 * Determines if an integer is a decimal palindrome through string comparison 
 */
func IsDecimalPalindrome (value:Int) -> Bool
{
	// Convert the integer to a string
	let forward:String = String(value)
	
	// Reverse the string and compare to the original
	let reverse:String = String(forward.characters.reverse())
	
	if (forward == reverse)
	{
		return true;
	}
	
	return false;
}

/*
 * Determines if a 32-bit integer is a binary palindrome through string comparison 
 */
func IsBinaryPalindrome (input:Int) -> Bool
{	
	// Start at highest-order bit of int
	var position:Int = (sizeof(Int) * 8) - 1;
	
	// Determine the position of the first non-zero character
	while (position >= 0)
	{
		let positionValue:Int = (input & ( 1 << position )) >> position;
		
		if (positionValue == 1)
		{
			break;
		}
			
		position -= 1;
	}
	
	var forward:String = ""
	
	// Now load the string with the remaining digits
	while (position >= 0)
	{
		let positionValue:Int = (input & ( 1 << position )) >> position;
		
		forward += String(positionValue);
		
		position -= 1;
	}

	let reverse:String = String(forward.characters.reverse())
	
	if (forward == reverse)
	{
		return true;
	}
	
	return false;
}

let MAXIMUM_VALUE = 1000000;

var finalSum:Int = 0;

for (var i:Int = 0; i < MAXIMUM_VALUE; i++)
{
	if (IsDecimalPalindrome(i) && IsBinaryPalindrome(i))
	{
		finalSum += i;
	}
}

print ("The final sum is: \(finalSum)")