// Project Euler Problem 52, Swift
//
// It can be seen that the number, 125874, and its double, 251748, 
// contain exactly the same digits, but in a different order.
//
// Find the smallest positive integer, x, such that 2
// x, 3x, 4x, 5x, and 6x, contain the same digits.
//
// Answer: 142857

import Foundation

let MAXIMUM_VALUE:Int = 1000000;

func GetDigitVector (input:Int) -> [Int]
{
    var digits:[Int] = [Int]();
    var temp:Int = input;
    
    while (temp > 0)
    {
        digits.append (temp % 10); 
        temp /= 10;
    }
    
    return digits;
}

func HasSameDigits (input:Int) -> Bool
{
    var primary:[Int] = GetDigitVector (input);
    primary.sortInPlace()
    
    for (var i:Int = 2; i <= 6; i++)
    {
        var secondary:[Int] = GetDigitVector (i*input);
        secondary.sortInPlace()
        
        if (primary.count != secondary.count)
            {return false}
            
        if (primary != secondary)
            {return false}
    }
    
    return true;
}

var finalAnswer:Int = 0;

for (var i:Int = 1; i < MAXIMUM_VALUE; i++)
{
    if (HasSameDigits(i))
    {
        finalAnswer = i;
        break;
    }
}

print ("The target number is: \(finalAnswer)")