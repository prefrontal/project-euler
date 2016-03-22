// Project Euler Problem 42, Swift
//
// The nth term of the sequence of triangle numbers is given by, 
// tn = ½n(n+1); so the first ten triangle numbers are:
//
// 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
// 
// By converting each letter in a word to a number corresponding 
// to its alphabetical position and adding these values we form a 
// word value. For example, the word value for SKY is 
// 19 + 11 + 25 = 55 = t10. If the word value is a triangle number 
// then we shall call the word a triangle word.
// 
// Using words.txt (right click and 'Save Link/Target As...'), 
// a 16K text file containing nearly two-thousand common English 
// words, how many are triangle words?
//
// Answer: 162

import Foundation

let ASCII_CAPITAL_OFFSET:Int = 64;

// The file provided is a single line of text consisting of names
// in quotes separated by commas.  This function will put one name
// in quotes in each element of the output vector
func LoadFile () -> [String]
{
	do
	{
		let path = NSBundle.mainBundle().pathForResource ("../Data Files/042-Words", ofType: "txt")!
		let content = try String (contentsOfFile:path, encoding:NSUTF8StringEncoding)
		let names = content.componentsSeparatedByString (",")
		return names
	}
	catch
	{
		return [String]()
	}
}

// Brute force determination of a triangle number
func IsTriangleNumber (value:Int) -> Bool
{
	var triangleNumber:Int = 1;
	var iteration:Int = 1;
	
	// Keep calculating the next triangle iteration until
	// we either match or overshoot the input value
	while (triangleNumber <= value)
	{
		if (triangleNumber == value)
		{
			return true;
		}
			
		iteration++;
		triangleNumber = Int(0.5 * Double(iteration) * Double(iteration + 1))
	} 
	
	return false;
}

func IsTriangleWord (input:String) -> Bool
{
	// Don't modify the input variable
	var word:String = input;
	
	// Trim the quotes
	let range = word.startIndex.advancedBy(1)..<word.endIndex.advancedBy(-1)
	word = word[range]
  
	var letterSum:Int = 0;

	// Calculate the sum of letter representations
	for (var i:Int = 0; i < word.characters.count; i++)
	{
		let letter = word[word.startIndex.advancedBy(i)]
		let value = String(letter).unicodeScalars.first?.value
		letterSum += Int(value!) - ASCII_CAPITAL_OFFSET;
	}
	
	return ( IsTriangleNumber(letterSum) )
}

var triangleWordCount:Int = 0;
var words:[String] = LoadFile();

for it in words
{
	if (IsTriangleWord(it))
	{
		triangleWordCount++;
	}
}

print ("The number of triangle words is: \(triangleWordCount)")