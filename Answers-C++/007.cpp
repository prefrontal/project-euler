// Project Euler Problem 7

// By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13
// we can see that the 6th prime is 13.
// What is the 10,001st prime number?
// Answer: 104743

#include <iostream>

namespace
{
    const int TARGET_VALUE = 10001;
}

/*
 * Brute-force check to determine if a number is prime
 * Used to validate the Sieve results.  Could also be
 * used when the Sieve would use too much memory.
*/
bool IsPrime (const int testValue)
{
    // There are no primes less than 2
    if (testValue < 2)
        return false;
    
    bool primeState = true;
    
    for (int i = 2; i < testValue; ++i)
    {
        if ((testValue % i) == 0)
            primeState = false;
    }
    
    return primeState;
}

/*
 * Find specific primes according to their ordinal position
 */
int main(int argc, char *argv[]) 
{
    // Starting at thirteen means we can do some modulo checks for speed
    int currentValue = 13;
    int primeCounter = 6;
    
    while (true)
    {
        currentValue += 2;
        
        if ( (0 == (currentValue%3)) || (0 == (currentValue%5)) || (0 == (currentValue%7)) || (0 == (currentValue%11)) )
            continue;
             
        if (IsPrime(currentValue))
            primeCounter++;
            
        if (TARGET_VALUE == primeCounter)
            break;
    }
    
    std::cout << "The " << TARGET_VALUE << " prime is: " << currentValue;
}