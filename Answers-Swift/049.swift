// Project Euler Problem 49, Swift
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
// Answer: 2969 6299 9629

import Foundation

// We will be working with four-digit integers
let MINIMUM_VALUE:Int = 1000;
let MAXIMUM_VALUE:Int = 9999;

// This is the value we already know
let GIVEN_VALUE:Int = 1487;

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

/*
 * Brute-force check to determine if a number is prime
 * Used to validate the Sieve results.  Could also be
 * used when the Sieve would use too much memory.
*/
func IsPrime (testValue:Int) -> Bool
{
    // There are no primes less than 2
    if (testValue < 2)
    {
        return false;
    }
    
    var primeState:Bool = true;
    
    for (var i:Int = 2; i < testValue; ++i)
    {
        if ((testValue % i) == 0)
        {
            primeState = false;
        }
    }
    
    return primeState;
}

// Computes the next lexicographical permutation of the specified
// array of numbers in place, returning whether a next permutation
// existed. (Returns false when the argument is already the last
// possible permutation.)
//
// https://www.nayuki.io/page/next-lexicographical-permutation-algorithm
//
func nextPermutation (inout sequence:String) -> Bool
{
    var array = Array(sequence.characters)
    
    // Find non-increasing suffix
    var i = array.count - 1;
    
    while (i > 0 && array[i - 1] >= array[i])
    {
        i--;
    }
        
    if (i <= 0)
    {
        sequence = String(array)
        return false;
    }
    
    // Find successor to pivot
    var j = array.count - 1;
    
    while (array[j] <= array[i - 1])
    {
        j--;
    }
    
    var temp = array[i - 1];
    array[i - 1] = array[j];
    array[j] = temp;

    // Reverse suffix
    j = array.count - 1;
    
    while (i < j) 
    {
        temp = array[i];
        array[i] = array[j];
        array[j] = temp;
        i++;
        j--;
    }
    
    sequence = String(array)
    return true;
}


// Determine if one number is a permutation of another
func IsPermutation (start:Int, _ target:Int) -> Bool
{
    var permutation:Bool = false;
    
    // Convert the integer to a string
    var startString:String = String(start)
    
    // Check if each permutation of the string
    // matches the given integer target
    repeat
    {
        let number:Int = Int(startString)!
        
        if (number == target)
        {
            permutation = true;
        }
    }
    while (nextPermutation(&startString));
    
    return permutation;
}


var primes:[Int] = [Int]()
GetPrimes (MAXIMUM_VALUE, &primes);

// Loop over the list of primes, determining if they are a 
// candidate for the sequence based on given constraints
for (var i:Int = 0; i < primes.count; i++)
{
    // Continue if less than our minimum or already known
    if ((primes[i] < MINIMUM_VALUE) || (primes[i] == GIVEN_VALUE))
    {
        continue;
    }
       
    for (var j:Int = i+1; j < primes.count; j++)
    {
        var difference:Int = primes[j] - primes[i];
        var thirdNumber:Int = primes[j] + difference;
        
        // Continue if above the maximum or not prime
        if ((thirdNumber > MAXIMUM_VALUE) || (!IsPrime (thirdNumber)))
        {
            continue;
        }
        
        // Determine if they are all permutations of each other
        if (IsPermutation(primes[i], primes[j]) && IsPermutation(primes[i], thirdNumber))
        {
            print ("The sequence is: \(primes[i]) \(primes[j]) \(thirdNumber)")
        }
    }
}