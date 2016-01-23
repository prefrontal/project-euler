// Project Euler Problem 16, Swift
//
// 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
// What is the sum of the digits of the number 2^1000?
//
// Answer: 1366

import Foundation

let EXPONENT = 1000.0;

// A double can hold from 2^0 to 2^1023 exactly
// http://www.exploringbinary.com/what-powers-of-two-look-like-inside-a-computer/
// http://www.exploringbinary.com/a-simple-c-program-that-prints-2098-powers-of-two/

let number = pow (2.0, EXPONENT);
let numberString = String(NSString(format:"%.0f", number))
var sum = 0;

for character in numberString.characters
{
	sum += Int(String(character))!
}

print ("The sum of digits is: \(sum)")