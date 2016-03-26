// Project Euler Problem 50, Swift
//
// The prime 41, can be written as the sum of six consecutive primes:
//
// 41 = 2 + 3 + 5 + 7 + 11 + 13
// 
// This is the longest sum of consecutive primes that adds to a prime below one-hundred.
// 
// The longest sum of consecutive primes below one-thousand that 
// adds to a prime, contains 21 terms, and is equal to 953.
// 
// Which prime, below one-million, can be written as the sum of the most consecutive primes?
// 
// Answer: 997651

import Foundation

let MAXIMUM_VALUE:Int = 1000000;	

/*
 * Sieve of Eratosthenes (integers)
 * Simple, ancient algorithm for finding all prime numbers up to any given limit.
 * It does so by iteratively marking as composite (i.e., not prime) the multiples
 * of each prime, starting with the multiples of 2.
 *
 * Provides a vector of integers that represent the prime numbers under the maximum value
*/
func GetPrimes (maximum:Int, inout _ primes:[Int])
{
    // Clear the input vector in case there is existing data
    primes = [Int]()
    
    // There are no primes less than 2
    if (maximum < 2)
    {
        return;
    }
    
    // Construct and execute the Sieve
    let sqrtMaximum:Int = Int( sqrt(Double(maximum)) );
    var primeTracker:[Bool] = [Bool](count:maximum, repeatedValue:true);
    
    for (var i:Int = 2; i < sqrtMaximum; ++i)
    {
        if (!primeTracker[i])
        {
            continue;
        }
        
        for (var j:Int = i + i; j < maximum; j += i)
        {
            if (j < 0)  // Guard against integer overflow
            {
                break;
            }
            
            primeTracker[j] = false;
        }
    }
    
    // Generate the list of primes to return
    for (var k:Int = 2; k < maximum; ++k)
    {
        if (primeTracker[k] == true)
        {
            primes.append (k);
        }
    }
}

// This answer is computationally inefficient. Since we work backward over the primes
// array we actually find the answer within a few seconds. However, it takes a significant
// amount of time to go through the entire primes array to know the definitive answer.
// This could/should be reworked with a another strategy that is more optimal.

var primes:[Int] = [Int]()
GetPrimes (MAXIMUM_VALUE, &primes);

// For loop efficieny, cache the size
var numPrimes:Int = primes.count

var maxPrimeCount:Int = 0;
var maxPrime:Int = 0;

// Loop over all primes in the vector in reverse since we assume
// our target is a value closer to the top value than the bottom
for testPrime in primes
{
    // This loop defines the starting point for 
    // calculating the consecutive sums
    for (var j:Int = 0; j < numPrimes; j++)
    {
        var primeCount:Int = 0;
        var primeSum:Int = 0;
        
        // Calculate the consecutive prime sum
        while (primeSum < testPrime)
        {
            if (j+primeCount >= numPrimes)
            {
                break;
            }
                
            primeSum += primes[j+primeCount];
            primeCount++;
        }
            
        // Count it if we hit the prime exactly and have the highest count
        if ((primeSum == testPrime) && (primeCount > maxPrimeCount))
        {
            maxPrime = testPrime;
            maxPrimeCount = primeCount;
        }
    }
}

print ("The target prime is: \(maxPrime)")