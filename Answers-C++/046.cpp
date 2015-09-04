// Project Euler 46
//
// It was proposed by Christian Goldbach that every odd composite 
// number can be written as the sum of a prime and twice a square.
// 
// 9 = 7 + 2×1^2
// 15 = 7 + 2×2^2
// 21 = 3 + 2×3^2
// 25 = 7 + 2×3^2
// 27 = 19 + 2×2^2
// 33 = 31 + 2×1^2
// 
// It turns out that the conjecture was false.
// 
// What is the smallest odd composite that cannot be written 
// as the sum of a prime and twice a square?
//
// Answer: 5777

#include <cmath>
#include <iostream>
#include <vector>

namespace
{
    const int MAXIMUM_VALUE = 10000;
    const int STARTING_VALUE = 33;
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
 * Generate all primes up to a given maximum value
 */
void GetSquares (const int maximum, std::vector<int> &squares)
{
    squares.clear();
    
    int index = 0;
    
    while (index*index < maximum)
    {
        squares.push_back (index*index);
        index++;
    }
}

int main (int argc, char *argv[]) 
{
    int lowestComposite = 0;
    
    std::vector<int> primes;
    GetPrimes (MAXIMUM_VALUE, primes);
    
    std::vector<int> squares;
    GetSquares (MAXIMUM_VALUE, squares);
    
    // Main loop evaluating odd composite numbers
    // To keep things simple, we will not exclude prime numbers,
    // which will always have a solution anyway as prime + 0^2
    for (int i = STARTING_VALUE; i < MAXIMUM_VALUE; i += 2)
    {
        bool hasNoSolution = true;
        
        // Loop iterating over primes
        for (int j = 0; j < primes.size(); j++)
        {
            // Break the loop if we have exceeded the number
            if (j > i)
                break;
            
            // Loop iterating over squares
            for (int k = 0; k < squares.size(); k++)
            {
                // Break the loop if we have exceeded the number
                if (k > i)
                    break;
                
                if (i == primes[j] + 2*squares[k])
                    hasNoSolution = false;
            }
        }
        
        // Have we found the target?
        if (hasNoSolution)
        {
            lowestComposite = i;
            break;
        }
    }
    
    std::cout << "The lowest odd composite without a solution is: " << lowestComposite << std::endl;
}