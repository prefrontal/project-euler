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
	std::stringstream ss;
	ss << value;
	std::string forward = ss.str();
	
	// Reverse the string and compare to the original
	std::string reverse;
	std::reverse_copy (forward.begin(), forward.end(), std::back_inserter(reverse));
	
	if (0 == forward.compare(reverse))
		return true;

	return false;
}

/*
 * Determines if a 32-bit integer is a binary palindrome through string comparison 
 */
func IsBinaryPalindrome (input:Int) -> Bool
{
	std::stringstream ss;
	
	// Start at highest-order bit of int
	int position = (sizeof(int) * 8) - 1;
	
	// Determine the position of the first non-zero character
	while (position >= 0)
	{
		int positionValue = (input & ( 1 << position )) >> position;
		
		if (positionValue == 1)
			break;
			
		position -= 1;
	}
	
	// Now load the stringstream with the remaining digits
	while (position >= 0)
	{
		int positionValue = (input & ( 1 << position )) >> position;
		
		ss << positionValue;
		
		position -= 1;
	}
	
	std::string forward = ss.str();
	std::string reverse;
	std::reverse_copy(forward.begin(), forward.end(), std::back_inserter(reverse));
	
	if (0 == forward.compare(reverse))
		return true;

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