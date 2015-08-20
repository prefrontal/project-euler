// Project Euler Problem 34
//
// 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
// 
// Find the sum of all numbers which are equal to the sum of the factorial of their digits.
// 
// Note: as 1! = 1 and 2! = 2 are not sums they are not included.
//
// Answer: 40730

#include <iostream>

namespace
{
    const int MAXIMUM_VALUE = 100000;
}

// Recursively calculate factorial value of an integer
int factorial (const int x) 
{
    // Check for appropriate positive value
    if (x < 0)
        return 0;    
    
    // Special case at a value of zero and one
    if ((x == 0) || (x == 1))
        return 1;
    
    // Calculate factorial
    if (x == 1) 
        return x; 

    return x * factorial (x - 1);
}

// Brute force search between 10 and a predefined maximum value
int main (int argc, char *argv[]) 
{
    int finalSum = 0;
    
    for (int i = 10; i < MAXIMUM_VALUE; i++)
    {
        int temp = i; 
        int factorialSum = 0;   
    
        while (temp > 0)
        {
            factorialSum += factorial (temp % 10);
            temp /= 10;
        }
            
        if (i == factorialSum)
            finalSum += i;
    }

    std::cout << "The final sum is: " << finalSum << std::endl;
}