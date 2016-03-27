// Project Euler Problem 53, Swift
//
// There are exactly ten ways of selecting three from five, 12345:
// 
// 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
// 
// In combinatorics, we use the notation, 5C3 = 10.
// 
// In general,
// 
// nCr = n! / r!(n−r)!
// where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
// 
// It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.
// How many, not necessarily distinct, values of nCr, for 1 ≤ n ≤ 100, are greater than one-million?
//
// Answer: 4075

import Foundation

let UPPER_NCR_LIMIT:Int = 100;
let UPPER_RESULT_LIMIT:Int = 1000000;

// We know that we will overflow a long long int for this question
// so we are cheating a bit here. Since we later just need to know
// if it is greater than an upper limit, we can hold the huge number 
// in a double knowing that it will work for the final comparison.

// Calculate the factorial of an input integer
// Return the value as a double and not a long long integer
func factorial (input:Int) -> Double
{
    var temp:Int = input;
    var result:Double = 1;

    while (temp > 1) 
        {result *= Double(temp--)}
    
    return result;
}

var finalCount:Int = 0;
 
for (var n:Int = 1; n <= UPPER_NCR_LIMIT; n++) 
{
    for (var r:Int = 0; r <= n; r++) 
    {
        if (factorial(n) / (factorial(r)*factorial(n-r)) >= Double(UPPER_RESULT_LIMIT))
               {finalCount++}
    }
}

print ("The final count is: \(finalCount)")