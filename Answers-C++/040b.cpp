// Project Euler Problem 40
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

#include <iostream>
#include <sstream>
#include <string>
#include <vector>

namespace
{
    const int TARGET_INDICES[] = {1, 10, 100, 1000, 10000, 100000, 1000000};
    const int NUM_TARGETS = 7;
}

// Take an integer and create a vector of the digits
std::vector<int> IntToVector (const int input)
{
    std::vector<int> digits;
    int temp = input;
    
    while (temp > 0)
    {
        digits.push_back (temp % 10);
        temp /= 10;
    }
    
    std::reverse (digits.begin(), digits.end());
    
    return digits;
}

int main (int argc, char *argv[]) 
{
    // We will be multiplying later, so a value of one here
    int finalProduct = 1;
    int lastNumber = 0;
    
    const int maximumDigitCount = TARGET_INDICES[NUM_TARGETS-1];
    int currentDigitCount = 0;
    int targetIndex = 0;
    
    while (currentDigitCount <= maximumDigitCount)
    {
        lastNumber += 1;
        
        std::vector<int> digits = IntToVector (lastNumber);
        
        for (auto it = digits.begin(); it < digits.end(); it++)
        {
            currentDigitCount++;
            
            if (currentDigitCount == TARGET_INDICES[targetIndex])
            {
                targetIndex++;
                finalProduct *= *it;
            }
        }
    }

    std::cout << "Reached digit goal at: " << lastNumber << std::endl;
    std::cout << "The final product is: " << finalProduct << std::endl;
}