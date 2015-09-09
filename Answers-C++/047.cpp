// Project Euler Problem 47
//
// The first two consecutive numbers to have two distinct prime factors are:
// 
// 14 = 2 × 7
// 15 = 3 × 5
// 
// The first three consecutive numbers to have three distinct prime factors are:
// 
// 644 = 2² × 7 × 23
// 645 = 3 × 5 × 43
// 646 = 2 × 17 × 19.
// 
// Find the first four consecutive integers to have four distinct prime factors. 
// What is the first of these numbers?
//
// Answer: 134043

#include <cmath>
#include <iostream>
#include <vector>

namespace
{
    const int TARGET_FACTOR_COUNT = 4;
    const int TARGET_RUN_LENGTH = 4;
    const int MAXIMUM_VALUE = 150000;
}

/*
 * Sieve of Eratosthenes (integers)
 * Simple, ancient algorithm for finding all prime numbers up to any given limit.
 * It does so by iteratively marking as composite (i.e., not prime) the multiples
 * of each prime, starting with the multiples of 2.
 *
 * Provides a vector of integers that represent the prime numbers under the maximum value
*/
void GetPrimes (const int maximum, std::vector<int> &primes)
{
    // Clear the input vector in case there is existing data
    primes.clear();
    
    // There are no primes less than 2
    if (maximum < 2)
        return;
    
    // Construct and execute the Sieve
    const int sqrtMaximum = static_cast<int>( sqrt(static_cast<double>(maximum)) );
    std::vector<bool> primeTracker (maximum, true);
    
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
    
    // Generate the list of primes to return
    for (int k = 2; k < maximum; ++k)
    {
        if (primeTracker[k] == true)
            primes.push_back (k);
    }
}

/*
 * Get a list of the prime factors of a given integer
 * This function expects to have a valid list of primes passed in
 */
int GetPrimeFactors (const int number, const std::vector<int> primes)
{
    int factorCount = 0;
    int lastFactor = 0;
    int remainder = number;
    
    // Keep looping until we reach the end of our dividing
    while (remainder != 1 )
    {
        // Determine the lowest prime that we can use to divide the remainder
        for (int i = 0; i < primes.size(); i++)
        {
            if (remainder <= 1) // Sanity check
                break;
            
            // Found a prime factor
            if (0 == remainder % primes[i])
            {
                // If the current factor is the same as
                // the last one then don't count it
                if (primes[i] != lastFactor)
                {
                    factorCount++;
                    lastFactor = primes[i];
                }
                
                remainder /= primes[i];
                break;
            }
        }
    }

    return factorCount;
}

// We are using brute force for the prime factor search
// This takes about sixteen seconds on my machine
// There are clearly some ways that we could speed this up

int main (int argc, char *argv[]) 
{
    std::vector<int> primes;
    GetPrimes (MAXIMUM_VALUE, primes);
    
    int leadValue = 0;
    int consecutivePrimeCount = 0;
    
    // Examine all integers up to the maximum value
    // Start at one so we don't try to factor zero
    for (int i = 1; i < MAXIMUM_VALUE; i++)
    {   
        int factorCount = GetPrimeFactors (i, primes);
        
        // Reset the counter if we didn't get the right number of factors
        if (factorCount != TARGET_FACTOR_COUNT)
        {
            consecutivePrimeCount = 0;
            continue;
        }
        
        // If this is the first in a new potential sequence 
        // then keep track of the lead integer value
        if (consecutivePrimeCount == 0)
            leadValue = i;
        
        consecutivePrimeCount++;
        
        // Determine if we have found the target run
        if (consecutivePrimeCount == TARGET_RUN_LENGTH)
            break;
    }
    
    std::cout << "The target integer is: " << leadValue << std::endl;
}