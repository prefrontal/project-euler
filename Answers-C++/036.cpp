// Project Euler Problem 36
//
// The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
//
// Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
// 
// (Please note that the palindromic number, in either base, may not include leading zeros.)
//
// Answer: 872187

#include <iostream>
#include <sstream>

namespace
{
	const int MAXIMUM_VALUE = 1000000;
}

/*
 * Determines if an integer is a decimal palindrome through string comparison 
 */
bool IsDecimalPalindrome (const int value)
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
bool IsBinaryPalindrome (const int input)
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

int main (int argc, char *argv[]) 
{
    int finalSum = 0;

	for (int i = 0; i < MAXIMUM_VALUE; i++)
	{
		if (IsDecimalPalindrome(i) && IsBinaryPalindrome(i))
			finalSum += i;
	}
	
	std::cout << "The final sum is: " << finalSum << std::endl;
}