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

namespace
{
    const int TARGET_INDICES[] = {1, 10, 100, 1000, 10000, 100000, 1000000};
    const int NUM_TARGETS = 7;
}

int main (int argc, char *argv[]) 
{
    // We will be multiplying later, so a value of one here
    int finalProduct = 1;
    int lastNumber = 0;
    
    // Use a stringstream to assemble the sequence
    std::string assembly;
    const int maximumDigitCount = TARGET_INDICES[NUM_TARGETS-1];
    
    while (assembly.length() <= maximumDigitCount)
    {
        lastNumber += 1;
        
        std::stringstream ss;
        ss << lastNumber;
        assembly += ss.str();
    }

    std::cout << "Reached digit goal at: " << lastNumber << std::endl;
    
    // Find the product of the numbers at the target indices
    for (int i = 0; i < 7; i++)
    {
        int a = 0;
        std::stringstream ss;
        ss << assembly[TARGET_INDICES[i]-1];
        ss >> a;
        
        finalProduct *= a;
    }
    
    std::cout << "The final product is: " << finalProduct << std::endl;
}