// Project Euler Problem 49
//
// The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, 
// is unusual in two ways: 
// (i) each of the three terms are prime, and, 
// (ii) each of the 4-digit numbers are permutations of one another.
// 
// There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, 
// exhibiting this property, but there is one other 4-digit increasing sequence.
// 
// What 12-digit number do you form by concatenating the three terms in this sequence?
// 
// Answer:

#include <cmath>
#include <iostream>
#include <vector>

namespace
{
    const int MAXIMUM_VALUE = 9999;
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

int main (int argc, char *argv[]) 
{
    std::vector<int> primes;
    GetPrimes (MAXIMUM_VALUE, primes);
}