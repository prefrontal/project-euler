// Project Euler Problem 27
//
// Euler discovered the remarkable quadratic formula:
//
// n² + n + 41
// 
// It turns out that the formula will produce 40 primes for the consecutive 
// values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is 
// divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.
// 
// The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes for the 
// consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.
// 
// Considering quadratics of the form:
//
// n² + an + b, where |a| < 1000 and |b| < 1000
//
// where |n| is the modulus/absolute value of n
// e.g. |11| = 11 and |−4| = 4
// Find the product of the coefficients, a and b, for the quadratic expression that produces 
// the maximum number of primes for consecutive values of n, starting with n = 0.
//
// Answer: -59231

#include <iostream>

// This answer isn't terribly fast since it completes in five seconds
// Some additional math would likely optimize the routine, but
// the brute force approach works OK for now...

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

int main (int argc, char *argv[]) 
{
    int maxA = 0;
    int maxB = 0;
    int maxPrimeCount = 0;
    
    for (int a = -1000; a <= 1000; a++)
    {
        for (int b = -1000; b <= 1000; b++)
        {
            bool hasConsecutivePrimes = true;
            int primeCount = 0;
            int n = 0;
            
            while (hasConsecutivePrimes)
            {
                int nextValue = n*n + a*n + b;

                hasConsecutivePrimes = IsPrime (nextValue);
                
                if (hasConsecutivePrimes)
                    primeCount++;
                    
                n += 1;
            }
            
            if (primeCount > maxPrimeCount)
            {
                maxPrimeCount = primeCount;
                maxA = a;
                maxB = b;
            }
        }
    }
    
    std::cout << "Greatest number of consecutive primes: " << maxPrimeCount << std::endl;
    std::cout << "The product of the coefficients was: " << (maxA * maxB) << std::endl;
}