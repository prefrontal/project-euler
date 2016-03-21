// Project Euler Problem 40, Swift
//
// An irrational decimal fraction is created by concatenating the positive integers:
//
// 0.123456789101112131415161718192021...
//
// It can be seen that the 12th digit of the fractional part is 1.
//
// If dn represents the nth digit of the fractional part, find the value of the following expression.
//
// d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
//
// Answer: 210

import Foundation

let TARGET_INDICES:[Int] = [1, 10, 100, 1000, 10000, 100000, 1000000]
let NUM_TARGETS:Int = 7;

// We will be multiplying later, so a value of one here
var finalProduct:Int = 1;
var lastNumber:Int = 0;

// Use a string to assemble the sequence
let maximumDigitCount = TARGET_INDICES[NUM_TARGETS-1];
var assembly:[Int] = [Int]()
assembly.reserveCapacity (maximumDigitCount)

while (assembly.count <= maximumDigitCount)
{
	lastNumber += 1;
	
	// Tried to just use a big string, but that took hours
	// Using an array and mapping characters to it was much faster, just a few seconds
	let characters = String(lastNumber).characters.map { String($0) }

	for character in characters
	{
		assembly.append (Int(character)!)
	}
}

print ("Reached digit goal at: \(lastNumber)")

// Find the product of the numbers at the target indices
for (var i:Int = 0; i < 7; i++)
{	
	let index:Int = TARGET_INDICES[i]-1
	//let character:Character = assembly[assembly.startIndex.advancedBy(index)]
	//let a:Int = Int(String(character))!
	
	finalProduct *= assembly[index];
}

print ("The final product is: \(finalProduct)")