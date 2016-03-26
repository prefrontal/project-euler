// Project Euler Problem 51, Swift
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

import Foundation

let MAXIMUM_VALUE:Int = 1000000;
let TARGET_PRIME_COUNT:Int = 8;

// --PRIME HELPERS----------------------------------------------------------------

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

// --VECTOR HELPERS--------------------------------------------------------------

// Take an integer and create a vector of the digits
func IntToVector (input:Int) -> [Int]
{
    var digits:[Int] = [Int]();
    var temp:Int = input;
    
    while (temp > 0)
    {
        digits.append (temp % 10);
        temp /= 10;
    }

    digits = digits.reverse()
    
    return digits;
}

// Take a vector of single integers and generate a whole integer value
func VectorToInt (input:[Int]) -> Int
{
    var output:Int = 0;
    
    for (var i:Int = 0; i < input.count; i++)
    {
        output += input[i] * Int(pow (Double(10), Double(input.count-i-1)));
    }

    return output;
}

// --MAIN METHODS--------------------------------------------------------------

// This is a tough one. I admit I had to look it up to get some help.
//
// From: http://www.mathblog.dk/project-euler-51-eight-prime-family/
// 1) The repeated digits have to be a 0, 1, or 2 to have an eight-member family
// 2) There must be three repeating digits
// 3) Last digit cannot be repeating
// 4) The lowest prime will have five or six digits

func IsEightMemberPrimeFamily (input:[Int], _ index1:Int, _ index2:Int, _ index3:Int) -> Bool
{
    var primeCount:Int = 0; 
    var temp:[Int] = input;
    
    // Swap positions with new value and evaluate primeness
    // The input is guaranteed to be prime, but we will iterate over it anyway
    for (var i:Int = 0; i < 10; i++)
    {
        temp[index1] = i;
        temp[index2] = i;
        temp[index3] = i;
        
        // Continue if the number starts with zero
        if (temp[0] == 0)
        {
            continue;
        }
        
        let newValue:Int = VectorToInt (temp);

        if (IsPrime(newValue))
        {
            primeCount++;
        }
    }
    
    return (TARGET_PRIME_COUNT == primeCount);
}

func EvaluateNumber (input:[Int]) -> Bool
{
    // Setup pattern indices
    var indices:[[Int]] =
    [
        [2, 3, 4],
        [1, 3, 4],
        [1, 2 ,4],
        [1, 2, 3],
        [0, 3, 4],
        [0, 2, 4],
        [0, 2, 3],
        [0, 1, 4],
        [0, 1, 3],
        [0, 1, 2]
    ]
    
    var foundAnswer:Bool = false;
    
    // Iterate over all patters, evaluating if thery are candidates
    for (var i:Int = 0; i < 10; i++)
    {
        // Skip some permutations if there are only five digits
        if ((input.count == 5) && (indices[i][2] == 4))
        {
            continue;
        }
            
        // Evaluate digit equivalency
        if (input[indices[i][0]] != input[indices[i][1]])
            {continue}
        else if (input[indices[i][0]] != input[indices[i][2]])
            {continue}
        else if (input[indices[i][1]] != input[indices[i][2]])
            {continue}
        
        // Evaluate if it is an eight member prime family
        foundAnswer = foundAnswer || IsEightMemberPrimeFamily (input, indices[i][0], indices[i][1], indices[i][2])
    } 
    
    return foundAnswer;
}

var primes:[Int] = [Int]();
GetPrimes (MAXIMUM_VALUE, &primes);

var finalAnswer:Int = 0;

for it in primes
{
    var foundSolution:Bool = false;
    var digits:[Int] = IntToVector (it);
    
    // Searche five- and six-digit numbers for a solution
    if (it < 10000)
    {
        continue;
    }
    else if (it < 1000000)
    {
        foundSolution = EvaluateNumber (digits);  
    }
        
    if (foundSolution)
    {
        finalAnswer = it;
        break;
    }
}

print ("The lowest prime in an eight member family is: \(finalAnswer)")