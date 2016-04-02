// Project Euler Problem 5
//
// 2520 is the smallest number that can be divided by each of the numbers
// from 1 to 10 without any remainder. What is the smallest positive number 
// that is evenly divisible by all of the numbers from 1 to 20?
// Answer: 232792560

#include <iostream>

namespace
{
     int MAX_DIVISOR = 20;   
}

/*
 * Checks to see if a number is evenly divisible by all numbers between
 * zero and a specified maximum divisor.
 */
bool IsEvenlyDivisible (const int value)
{
    if (value < MAX_DIVISOR)
        return false;
    
    bool evenlyDivisible = true;
    
    for (int i = MAX_DIVISOR; i > 0; --i)
    {
        if (0 != (value % i))
        {
            evenlyDivisible = false;
            break;
        }
    }
        
    return evenlyDivisible;
}

/*
 * Finds the smallest number that is evenly divisible
 */
int main(int argc, char *argv[]) 
{
    int currentValue = MAX_DIVISOR;
    
    while (true)
    {
        ++currentValue;
        
        if (IsEvenlyDivisible(currentValue))
            break;
    }
    
    std::cout << "Smallest positive evenly divisible number: " << currentValue << std::endl;
}