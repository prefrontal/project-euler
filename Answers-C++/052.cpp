// Project Euler Problem 52
//
// It can be seen that the number, 125874, and its double, 251748, 
// contain exactly the same digits, but in a different order.
//
// Find the smallest positive integer, x, such that 2
// x, 3x, 4x, 5x, and 6x, contain the same digits.
//
// Answer: 142857

#include <iostream>
#include <vector>

namespace
{
    const int MAXIMUM_VALUE = 1000000;
}

std::vector<int> GetDigitVector (const int input)
{
    std::vector<int> digits;
    int temp = input;
    
    while (temp > 0)
    {
        digits.push_back (temp % 10); 
        temp /= 10;
    }
    
    return digits;
}

bool HasSameDigits (const int input)
{
    std::vector<int> primary = GetDigitVector (input);
    std::sort (primary.begin(), primary.end());
    
    for (int i = 2; i <= 6; i++)
    {
        std::vector<int> secondary = GetDigitVector (i*input);
        std::sort (secondary.begin(), secondary.end());
        
        if (primary.size() != secondary.size())
            return false;
            
        if (primary != secondary)
            return false;
    }
    
    return true;
}

int main (int argc, char *argv[]) 
{
    int finalAnswer = 0;
    
    for (int i = 1; i < MAXIMUM_VALUE; i++)
    {
        if (HasSameDigits(i))
        {
            finalAnswer = i;
            break;
        }
    }
    
    std::cout << "The target number is: " << finalAnswer << std::endl;
}