// Project Euler Problem 25, Swift
//
// The Fibonacci sequence is defined by the recurrence relation:
//
// Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
// Hence the first 12 terms will be:
// 
// F1 = 1
// F2 = 1
// F3 = 2
// F4 = 3
// F5 = 5
// F6 = 8
// F7 = 13
// F8 = 21
// F9 = 34
// F10 = 55
// F11 = 89
// F12 = 144
// The 12th term, F12, is the first term to contain three digits.
// 
// What is the index of the first term in the Fibonacci sequence to contain 1000 digits?
//
// Answer: 4782

// We will need to store three numbers of up to 1000 digits to make this happen
// An array of integers makes the most sense here given that constraint

let DIGIT_TARGET:Int = 1000;

// We will be looking for exactly the DIGIT_TARGET, so
// and array of that size will suffice in this case
var a:[Int] = [Int](count:(DIGIT_TARGET), repeatedValue:0)
var b:[Int] = [Int](count:(DIGIT_TARGET), repeatedValue:0)
var c:[Int] = [Int](count:(DIGIT_TARGET), repeatedValue:0)

// We will start by calculating the third Fibonacci term
var termCount:Int = 2;
var digitCount:Int = 1;
b[0] = 1;
c[0] = 1;

// The order of numbers in the array will be reversed to 
// simplify the loop logic later on.
// So, the first element in the array [0] is the smallest
// digit in the actual number

repeat
{
	// Start by adding the previous two terms
	var remainder:Int = 0;

	for (var i:Int = 0; i < DIGIT_TARGET; i++)
	{
		var temp:Int = b[i] + c[i] + remainder;
		a[i] = temp % 10;
		remainder = Int(temp / 10);
	}
	
	// Update the last two values
	for (var j:Int = 0; j < DIGIT_TARGET; j++)
	{
		// Could have done this in the loop above, but
		// separating out responibility makes sense
		c[j] = b[j];
		b[j] = a[j];
	}      
	
	// Count the number of digits
	for (var k:Int = DIGIT_TARGET-1; k >= 0; k--)
	{
		// Identify the first non-zero value in the array
		// as we move from highest to lowest value.
		
		if (0 != a[k])
		{
			digitCount = k+1;
			break;
		}
	}
	
	termCount++;
}
while (digitCount != DIGIT_TARGET);

print ("The term with \(DIGIT_TARGET) digits is: \(termCount)")