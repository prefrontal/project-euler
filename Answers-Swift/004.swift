// Project Euler Problem 4, Swift
//
// A palindromic number reads the same both ways. 
// The largest palindrome made from the product of two 
// 2-digit numbers is 9009 = 91 × 99. Find the largest 
// palindrome made from the product of two 3-digit numbers.
//
// Answer: 906609

/*
 * Determines if an integer is a palindrome through string comparison 
 */
func IsPalindrome (value:Int) -> Bool
{
	let forward = String (value)
	let reverse = String (forward.characters.reverse())

	if (forward == reverse)
	{
		return true
	}

	return false
}

/*
 * Determines if an integer is a palindrome through integer manipulation
 */
func IsPalindrome2 (value:Int) -> Bool
{
	var reversed = 0
	var temp = value
	
	while (temp != 0)
	{
		reversed *= 10
		reversed += (temp % 10)
		temp /= 10
	}
	
	if (value == reversed)
	{
		return true
	}
		
	return false
}

var maxPalindrome = 0

for var i = 100; i < 1000; ++i
{
	for var j = 100; j < 1000; ++j
	{
		if (!IsPalindrome2 (i * j))
		{
			continue
		}
			 
		if ((i*j) > maxPalindrome)
		{
			maxPalindrome = i * j
		}
	}
}

print ("The largest palindrome is: \(maxPalindrome)")