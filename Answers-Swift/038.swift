// Project Euler Problem 38, Swift
//
// Take the number 192 and multiply it by each of 1, 2, and 3:
//
// 192 × 1 = 192
// 192 × 2 = 384
// 192 × 3 = 576
//
// By concatenating each product we get the 1 to 9 pandigital, 192384576. 
// We will call 192384576 the concatenated product of 192 and (1,2,3)
// 
// The same can be achieved by starting with 9 and multiplying by 
// 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is 
// the concatenated product of 9 and (1,2,3,4,5).
// 
// What is the largest 1 to 9 pandigital 9-digit number that can be formed 
// as the concatenated product of an integer with (1,2, ... , n) where n > 1?
//
// Answer: 932718654

import Foundation

let MAXIMUM_VALUE = 100000;
let PANDIGITAL_VALUE_COUNT = 9;

// Determine if a string contains a pandigital number
func IsPandigital (input:String) -> Bool
{
	let temp:String = String(input.characters.sort())

	return (temp == "123456789")
}

// Return the number of characters in an integer
func GetIntegerLength (input:Int) -> Int
{
	var length:Int = 0;
	var temp:Int = input;
	
	while (temp > 0)
	{
		temp /= 10;
		length++;
	}
	
	return length;
}

// Determine the largest concatenated pandigital from integer multiplication

var largestPandigital:Int = 0;

for (var i:Int = 1; i < MAXIMUM_VALUE; i++)
{
	var multiplier:Int = 0;
	var valueCount:Int = 0;
	
	var ss:String = ""
	
	// Keep multiplying the base integer until we have
	// more digits than a standard pandigital number.
	// The use of stringstreams makes things easier here.
	while (valueCount < PANDIGITAL_VALUE_COUNT)
	{
		// Concatenate the next number
		multiplier += 1;
		ss += String(i*multiplier);
		valueCount = ss.characters.count
		
		// Test the number for pandigitality
		if ( IsPandigital(ss) )
		{
			var pandigitalValue:Int = 0;
			pandigitalValue = Int(ss)!
			
			if (pandigitalValue > largestPandigital)
			{
				largestPandigital = pandigitalValue;
			}
		}
	}
}

print ("The largest pandigital is: \(largestPandigital)")