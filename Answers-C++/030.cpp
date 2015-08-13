// Project Euler Problem 30
//
// Surprisingly there are only three numbers that can be written 
// as the sum of fourth powers of their digits:
// 
// 1634 = 1^4 + 6^4 + 3^4 + 4^4
// 8208 = 8^4 + 2^4 + 0^4 + 8^4
// 9474 = 9^4 + 4^4 + 7^4 + 4^4
// As 1 = 1^4 is not a sum it is not included.
// 
// The sum of these numbers is 1634 + 8208 + 9474 = 19316.
// 
// Find the sum of all the numbers that can be written as 
// the sum of fifth powers of their digits.
//
// Answer: 443839

#include <cmath>
#include <iostream>

namespace
{
    const int MAXIMUM_SEARCH_VALUE = 999999;
    const int MINIMUM_SEARCH_VALUE = 2;
    
    const int EXPONENT = 5;
}

int main (int argc, char *argv[]) 
{
    int overallSum = 0;
    
    // Go through all possible number in the range and evaluate if the
    // power of their digits is equal to the original number provided
    for (int i = MINIMUM_SEARCH_VALUE; i <= MAXIMUM_SEARCH_VALUE; i++)
    {
        int tempSum = 0;
        int number = i;
    
        while (number > 0)
        {
            tempSum += std::pow (number%10, EXPONENT);    
            number /= 10;
        }
        
        if (tempSum == i)
            overallSum += i;
    }
    
    std::cout << "The overall sum is: " << overallSum << std::endl;
}