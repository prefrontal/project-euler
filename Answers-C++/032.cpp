// Project Euler Problem 32
//
// We shall say that an n-digit number is pandigital if it makes use 
// of all the digits 1 to n exactly once; for example, the 5-digit 
// number, 15234, is 1 through 5 pandigital.
// 
// The product 7254 is unusual, as the identity, 39 × 186 = 7254, 
// containing multiplicand, multiplier, and product is 1 through 9 pandigital.
// 
// Find the sum of all products whose multiplicand/multiplier/product 
// identity can be written as a 1 through 9 pandigital.
// 
// HINT: Some products can be obtained in more than one way so 
// be sure to only include it once in your sum.
// 
// Answer: 45228

#include <cmath>
#include <iostream>
#include <set>

// The first attempt was a brute-force search through millions of number combinations
// This was a bit extreme and took significant time to run.  Instead, we now only
// look over the permutations of a pandigital number, dividing each permutation into
// many divisions of multiplicand, multiplier, and product.  This takes two seconds.

/* Generate an integer number from a subset of an array of single-digit integers
 * There is no range checking for this function since we know the upper
 * limit of the output will be less than 9876543 for this problem.
 */
int IntegerFromArray (int inputArray[], const int startIndex, const int stopIndex)
{
    int output = 0;
    int count = 0;
    
    for (int i = startIndex; i <= stopIndex; i++)
    {
        output += inputArray[i] * std::pow (10, count);
        count++;
    }
    
    return output;
}

int main (int argc, char *argv[]) 
{
    int digits[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
  
    std::set<int> values;
    
    // Test each permutation of the pandigital number array
    while (std::next_permutation (digits, digits+9))
    {
        // Multiplicand generation loop. May be up to seven digits.
        for (int i = 0; i <= 6; i++)
        {
            int multiplicand = IntegerFromArray (digits, 0, i);
            
            // Multiplier loop. May be up to seven digits.
            for (int j = i+1; j <= 7; j ++)
            {
                int multiplier = IntegerFromArray (digits, i+1, j);
                
                // Generate and test the product
                int product = multiplier * multiplicand;
                
                if (product == IntegerFromArray (digits, j+1, 8))
                    values.insert (product);
            }
        }
    }

    int finalSum = 0;
    
    for (auto it = values.begin(); it != values.end(); it++)
        finalSum += *it;
        
    std::cout << "The final sum is: " << finalSum << std::endl;

}