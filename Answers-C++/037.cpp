// Project Euler Problem 37
//
// The number 3797 has an interesting property. Being prime itself, 
// it is possible to continuously remove digits from left to right, 
// and remain prime at each stage: 3797, 797, 97, and 7. Similarly 
// we can work from right to left: 3797, 379, 37, and 3.
//
// Find the sum of the only eleven primes that are both 
// truncatable from left to right and right to left.
//
// NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
//
// Answer: 748317

#include <algorithm>
#include <cmath>
#include <iostream>
#include <vector>

namespace
{
    const int MAXIMUM_VALUE = 1000000;
    const int LOWER_PRIME_LIMIT = 7;
}

/*
 * Sieve of Eratosthenes
 * Simple, ancient algorithm for finding all prime numbers up to any given limit.
 * It does so by iteratively marking as composite (i.e., not prime) the multiples
 * of each prime, starting with the multiples of 2.
*/
void GetPrimes (const int maximum, std::vector<bool> &primes)
{
    // Clear the input vector in case there is existing data
    primes.clear();
    
    // There are no primes less than 2
    if (maximum < 2)
        return;
    
    // Construct and execute the Sieve
    const int sqrtMaximum = static_cast<int>( sqrt(static_cast<double>(maximum)) );
    std::vector<bool> primeTracker (maximum, true);
    
    // Block out the low numbers
    primeTracker[0] = false;
    primeTracker[1] = false;
    
    for (int i = 2; i < sqrtMaximum; ++i)
    {
        if (!primeTracker[i])
            continue;
        
        for (int j = i + i; j < maximum; j += i)
        {
            if (j < 0)  // Guard against integer overflow
                break;
            
            primeTracker[j] = false;
        }
    }
    
    // For this answer, just return the tracking array instead of the numbers
    // We need to do a lot of lookups and the tracking array increases speed
    // relative to doing a ton of find operations on a vector.
    primes = primeTracker;
}

// Determine if a number is a truncateable prime number
// Pass in a vector of boolean values representing prime numbers
// This dramatically speeds things up instead of recalculating
bool IsTruncateablePrime (const int value, const std::vector<bool> primes)
{
    if (value <= LOWER_PRIME_LIMIT)
        return false;
    
    // Truncate the number from right
    // Just start chopping off digits using a modulo
    // operation until there is nothing left
    int right = value;
    
    while (right > 0)
    {
        if (!primes[right])
            return false;
        
        right /= 10;
    }

    // Truncate the number from left
    // Instead of determining length, just start with modulo the 
    // maximum possible value and begin working down from there
    int left = value;
    
    for (int j = MAXIMUM_VALUE; j >= 10; j /= 10)
    {
        left = left % j;
        
        if (!primes[left])
            return false;     
    }

    return true;
}

int main (int argc, char *argv[]) 
{
	std::vector<bool> primes;
    GetPrimes (MAXIMUM_VALUE, primes);

    int finalSum = 0;

    for (int i = LOWER_PRIME_LIMIT; i < primes.size(); i++)
    {
        if (!primes[i])
            continue;
        
        if (IsTruncateablePrime (i, primes))
            finalSum += i;
    }

    std::cout << "The final sum is: " << finalSum << std::endl;
}