// Project Euler Problem 22, Swift
//
/// Using names.txt, a 46K text file containing over five-thousand first names, 
// begin by sorting it into alphabetical order. Then working out the alphabetical 
// value for each name, multiply this value by its alphabetical position in the 
// list to obtain a name score.
// 
// For example, when the list is sorted into alphabetical order, COLIN, which is 
// worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would 
// obtain a score of 938 × 53 = 49714.
// 
// What is the total of all the name scores in the file?
//
// Answer: 871198282

import Foundation

// The file provided is a single line of text consisting of names
// in quotes separated by commas.  This function will put one name
// in quotes in each element of the output vector
func LoadFile () -> [String]
{
	do
	{
		let path = NSBundle.mainBundle().pathForResource ("../Data Files/022-Names", ofType: "txt")!
		let content = try String (contentsOfFile:path, encoding:NSUTF8StringEncoding)
		let names = content.componentsSeparatedByString (",")
		return names
	}
	catch
	{
		return [String]()
	}
}

let ASCII_LETTER_OFFSET:Int = 64;
let ASCII_QUOTE_VALUE:Int = 34;	
	
// Get names and sort them
var names:[String] = LoadFile();
names.sortInPlace()

var finalSum:Int = 0
var nameCounter:Int = 0

// Iterate over the names, calculating the contribution
// of each name, multiplied by its position in the list
for name in names
{
	var tempSum:Int = 0;
	for i in name.characters 
	{
		var letterValue:Int = Int(String(i).unicodeScalars.first!.value)
		
		if (ASCII_QUOTE_VALUE == letterValue)
		{
			continue;
		}
				
		tempSum += letterValue - ASCII_LETTER_OFFSET;		
	}
	
	nameCounter++
	finalSum += nameCounter * tempSum;
}

print ("The final sum is: \(finalSum)")


