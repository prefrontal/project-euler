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

#include <algorithm>
#include <cmath>
#include <iostream>
#include <sstream>
#include <vector>

namespace
{
    // We will be working with four-digit integers
    const int MINIMUM_VALUE = 1000;
    const int MAXIMUM_VALUE = 9999;
    
    // This is the value we already know
    const int GIVEN_VALUE = 1487;
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

// Determine if one number is a permutation of another
bool IsPermutation (const int start, const int target)
{
    bool permutation = false;
    
    // Convert the integer to a string
    std::stringstream ss;
    ss << start;
    std::string startString = ss.str();
    
    // Check if each permutation of the string
    // matches the given integer target
    do
    {
        int number;
        std::stringstream (startString) >> number;
        
        if (number == target)
            permutation = true;
    }
    while ( std::next_permutation(startString.begin(), startString.end()) );
    
    return permutation;
}

int main (int argc, char *argv[]) 
{
    std::vector<int> primes;
    GetPrimes (MAXIMUM_VALUE, primes);
    
    // Loop over the list of primes, determining if they are a 
    // candidate for the sequence based on given constraints
    for (int i = 0; i < primes.size(); i++)
    {
        // Continue if less than our minimum or already known
        if ((primes[i] < MINIMUM_VALUE) || (primes[i] == GIVEN_VALUE))
            continue;
            
        for (int j = i+1; j < primes.size(); j++)
        {
            int difference = primes[j] - primes[i];
            int thirdNumber = primes[j] + difference;
            
            // Continue if above the maximum or not prime
            if ((thirdNumber > MAXIMUM_VALUE) || (!IsPrime (thirdNumber)))
                continue;
            
            // Determine if they are all permutations of each other
            if (IsPermutation(primes[i], primes[j]) && IsPermutation(primes[i], thirdNumber))
                std::cout << "The sequence is: " << primes[i] << primes[j] << thirdNumber << std::endl;
        }
    }
}