// Project Euler Problem 10
//
// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
// Find the sum of all the primes below two million.
// Answer: 142913828922

#include <cmath>
#include <iostream>
#include <vector>

namespace
{
    const int TARGET_NUMBER = 2000000;
}

/*
 * Sieve of Eratosthenes
 * Simple, ancient algorithm for finding all prime numbers up to any given limit.
 * It does so by iteratively marking as composite (i.e., not prime) the multiples
 * of each prime, starting with the multiples of 2.
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
 * Find the sume of all primes up to a given number
 */
int main(int argc, char *argv[]) 
{
    std::vector<int> myPrimes;
    GetPrimes (TARGET_NUMBER, myPrimes);
    
    int64_t primeSum = 0;
    
    for (auto it = myPrimes.begin(); it < myPrimes.end(); it++)
        primeSum += *it;
        
    std::cout << "The sum is: " << primeSum << std::endl;
}