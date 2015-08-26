// Project Euler Problem 26
//
// A unit fraction contains 1 in the numerator. The decimal representation of the 
// unit fractions with denominators 2 to 10 are given:
// 
// 1/2	= 	0.5
// 1/3	= 	0.(3)
// 1/4	= 	0.25
// 1/5	= 	0.2
// 1/6	= 	0.1(6)
// 1/7	= 	0.(142857)
// 1/8	= 	0.125
// 1/9	= 	0.(1)
// 1/10	= 	0.1
//
// Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. 
// It can be seen that 1/7 has a 6-digit recurring cycle.
//
// Find the value of d < 1000 for which 1/d contains the longest 
// recurring cycle in its decimal fraction part.
//
// Answer: 983

#include <cmath>
#include <iostream>
#include <vector>

namespace
{
    const int MAXIMUM_VALUE = 1000;
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

// Calculate pow(a,b) mod n
// For this problem std::pow(a,b)%n will overflow
// This template function calculates iteratively, avoiding the overflow
// From: http://stackoverflow.com/questions/8496182/calculating-powa-b-mod-n
template <typename T>
T modpow (T base, T exp, T modulus) 
{
    base %= modulus;
    T result = 1;
    
    while (exp > 0) 
    {
        if (exp & 1) result = (result * base) % modulus;
        base = (base * base) % modulus;
        exp >>= 1;
    }
    
    return result;
}

// Determine the cycle length of the fraction
// By solving the discrete logarithm
int DetermineCycleLength (const int value)
{
    for (int i = 1; i <= value; i++)
    {
        int a = modpow (10, i, value);
        
        if (a == 1)
            return i;
    }
    
    return 0;
}

int main(int argc, char *argv[]) 
{
    // We only need to look at prime values
    std::vector<int> primes;
    GetPrimes (MAXIMUM_VALUE, primes);
    
    int longestCycle = 0;
    int longestDenominator = 0;
    
    for (auto it = primes.begin(); it < primes.end(); it++)
    {
        int cycleLength = DetermineCycleLength (*it);

        if (cycleLength > longestCycle)
        {
            longestCycle = cycleLength;
            longestDenominator = *it;
        }
    }
    
    std::cout << "The denominator with the longest cycle is: " << longestDenominator << " with length: " << longestCycle << std::endl;
}