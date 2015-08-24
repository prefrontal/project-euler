// Project Euler Problem 35
//
// The number, 197, is called a circular prime because all rotations 
// of the digits: 197, 971, and 719, are themselves prime.
//
// There are thirteen such primes below 100: 
// 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
//
// How many circular primes are there below one million?
//
// Answer: 55

#include <cmath>
#include <iostream>
#include <sstream>
#include <vector>

namespace
{
    const int MAXIMUM_VALUE = 1000000;
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

// Moves the first character in a string to the end of the string
// This rotates the number, which is useful when looking for circular primes
std::string RotateNumber (const std::string input)
{
    return input.substr(1,input.length()-1) + input.substr(0,1);
}

// Find the number of circular primes between 2 and an upper bound
int main (int argc, char *argv[]) 
{
    std::vector<bool> primes;
    GetPrimes (MAXIMUM_VALUE, primes);
    
    int primeCount = 0;

    for (int i = 2; i < MAXIMUM_VALUE; i++)
    {
        // Is this number prime?
        if (!primes[i])
            continue;
        
        // Convert number to string for permutation
        std::stringstream ss;
        ss << i;
        std::string stringValue = ss.str();
        
        bool isCircularPrime = true;
        
        // Determine if each rotation is prime
        for (int j = 0; j < stringValue.length(); j++)
        {
            int permutationValue = 0;
            std::stringstream (stringValue) >> permutationValue;

            if (!primes[permutationValue])
                isCircularPrime = false;
                
            stringValue = RotateNumber (stringValue);
        }
        
        if (isCircularPrime)
        {
            primeCount++;
             std::cout << i << std::endl;   
        }
    }
    
    std::cout << "The count of circular primes is: " << primeCount << std::endl;
    
}