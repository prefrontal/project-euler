// Project Euler Problem 51
//
// By replacing the 1st digit of the 2-digit number *3, it turns out that six 
// of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
//
// By replacing the 3rd and 4th digits of 56**3 with the same digit, this 
// 5-digit number is the first example having seven primes among the ten
// generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 
// 56773, and 56993. Consequently 56003, being the first member of this family, 
// is the smallest prime with this property.
// 
// Find the smallest prime which, by replacing part of the number (not necessarily 
// adjacent digits) with the same digit, is part of an eight prime value family.
//
// Answer: 121313

#include <iostream>

namespace
{
    const int MAXIMUM_VALUE = 1000000;
    const int NUM_FIVE_DIGIT_PERMUTATIONS = 4;
    const int NUM_SIX_DIGIT_PERMUTATIONS = 10;
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

// This is a tough one. I admit I had to look it up to get some help.
//
// From: http://www.mathblog.dk/project-euler-51-eight-prime-family/
// 1) The repeated digits have to be a 0, 1, or 2 to have an eight-member family
// 2) There must be three repeating digits
// 3) Last digit cannot be repeating
// 4) The lowest prime will have five or six digits

bool IsEightMemberPrimeFamily (const std::vector<int> input, const int index1, const int index2)
{
    // The input is guaranteed to be prime, but we will iterate over it anyway
    int primeCount = 0; 
    
    std::vector<int> temp = input;
    
    for (int i = 0; i < 10; i++)
    {
        
    }
    
    return (8 == primeCount)
}

bool EvaluateNumber (const std::vector<int> input)
{
    // Setup pattern indices
    int indices[10][3] =
    {
        {2, 3, 4}
        {1, 3, 4}
        {1, 2 ,4}
        {1, 2, 3}
        {0, 3, 4}
        {0, 2, 4}
        {0, 2, 3}
        {0, 1, 4}
        {0, 1, 3}
        {0, 1, 2}
    }
    
    bool foundAnswer = false;
    
    for (int i = 0; i < NUM_SIX_DIGIT_PERMUTATIONS; i++)
    {
        // Skip some permutations if there are only five digits
        if ((input.size > 5) && (indices[i][3] == 4)
            continue;
        
        // Evaluate digit equivalency
        if (number[i][0] != number[i][1])
            continue;
        else if (number[i][0] != number[i][2])
            continue;
        else if (number[i][1] != number[i][2])
            continue;
        
        // We now know this is a prime number with three repeating digits
        // Evaluate all two digit pairs for familial primeness
        foundAnswer += IsEightMemberPrimeFamily (input, number[i][0], number[i][1]);
        foundAnswer += IsEightMemberPrimeFamily (input, number[i][0], number[i][2]);
        foundAnswer += IsEightMemberPrimeFamily (input, number[i][1], number[i][2]);
    } 
    
    return foundAnswer;
}

int main (int argc, char *argv[]) 
{
    std::vector<int> primes;
    GetPrimes (MAXIMUM_VALUE, primes);
    
    int finalAnswer = 0;
    
    for (auto it = primes.begin(); it < primes.end(); it++)
    {
        bool foundSolution = false;
        
        // Load the prime number digits into the vector
        std::vector<int> primeDigits;
        int temp = *it;
        
        while (temp > 0)
        {
            value.push_back (temp % 10);
            temp /= 10;
        }
        
        // Evaluate if number is the solution
        if (*it < 10000)
            continue;
        else if (*it < 1000000)
            foundSolution = EvaluateNumber (primeDigits);  
            
        if (foundSolution)
        {
            finalAnswer = *it;
            break;
        }
    }
    
    std::cout << "The lowest prime in an eight member family is: " << finalAnswer << std::endl;
}