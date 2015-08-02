// Project Euler Problem 16
//
// 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
// What is the sum of the digits of the number 2^1000?
// Answer: 1366

#include <math.h>

#include <iostream>
#include <sstream>
#include <string>

namespace
{
    const int EXPONENT = 1000;
    const int ASCII_OFFSET = 48;
}

/*
 * Calculate the sum of digits in any power of 2 up to 2^1023
 */
int main(int argc, char *argv[]) 
{
    // A double can hold from 2^0 to 2^1023 exactly
    // http://www.exploringbinary.com/what-powers-of-two-look-like-inside-a-computer/
    // http://www.exploringbinary.com/a-simple-c-program-that-prints-2098-powers-of-two/
    
    const double number = pow(2, EXPONENT);
    
    std::stringstream numberStream;
    numberStream.precision(0);
    numberStream << std::fixed << number;
    
    int length = numberStream.str().length();
    int sum = 0;
    
    for (int i = 0; i < length; i++)
        sum += numberStream.get() - ASCII_OFFSET;
    
    std::cout << "The sum of digits is: " << sum << std::endl;
}