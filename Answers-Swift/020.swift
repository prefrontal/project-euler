// Project Euler Problem 20, Swift
//
// n! means n × (n − 1) × ... × 3 × 2 × 1
//
// For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
// and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
//
// Find the sum of the digits in the number 100!
//
// Answer: 648

import Foundation

let FACTORIAL_NUMBER:Int = 100;
let NUMBER_ARRAY_SIZE:Int = 200;

// So, 100! = 9.332622e+157. We will need to do something clever here.

// Use an integer array to hold the large number
// Init first element to one so we can multiply later
var bigNumber:[Int] = [Int](count:NUMBER_ARRAY_SIZE, repeatedValue:0)
bigNumber[0] = 1;

for (var i:Int = 1; i <= FACTORIAL_NUMBER; i++) // Factorial loop
{
	var carryOver:Int = 0;
	
	for (var j:Int = 0; j < NUMBER_ARRAY_SIZE; j++) // Array loop
	{
		var temp:Int = (bigNumber[j] * i) + carryOver;
		bigNumber[j] = temp % 10;
		carryOver = Int(temp/10);
	}
}

var finalSum:Int = 0;

for (var t:Int = 0; t < NUMBER_ARRAY_SIZE; t++)
{
	finalSum += bigNumber[t];
}

print ("The final sum is: \(finalSum)")