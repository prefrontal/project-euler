// Project Euler Problem 33
//
// The fraction 49/98 is a curious fraction, as an inexperienced mathematician 
// in attempting to simplify it may incorrectly believe that 49/98 = 4/8, 
// which is correct, is obtained by cancelling the 9s.
// 
// We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
// 
// There are exactly four non-trivial examples of this type of fraction, 
// less than one in value, and containing two digits in the numerator and denominator.
// 
// If the product of these four fractions is given in its lowest common 
// terms, find the value of the denominator.
//
// Answer: 

#include <iostream>

double ComputeSecondQuotient (const int numerator, const int denominator)
{
    // Don't divide by zero
    if (denominator == 0)
        return 0.0;
        
    // The quotient should be less than one
    if (numerator >= denominator)
        return 0.0;
        
    return static_cast<double>(numerator) / static_cast<double>(denominator);
}

// Find the greatest common divisor of two numbers based on Stein's Algorithm
// From: https://en.wikipedia.org/wiki/Binary_GCD_algorithm
int GreatestCommonDivisor (int u, int v)
{
    int shift;

    // GCD(0,v) == v; GCD(u,0) == u, GCD(0,0) == 0
    if (u == 0) return v;
    if (v == 0) return u;
     
    // Let shift := lg K, where K is the greatest 
    // power of 2 dividing both u and v
    for (shift = 0; ((u | v) & 1) == 0; ++shift) 
    {
        u >>= 1;
        v >>= 1;
    }
     
    while ((u & 1) == 0)
        u >>= 1;
     
    // From here on, u is always odd
    do 
    {
        // Remove all factors of 2 in v -- they are not common
        // Note: v is not zero, so while will terminate
        while ((v & 1) == 0)  // Loop X
            v >>= 1;

        // Now u and v are both odd. Swap if necessary so u <= v,
        // then set v = v - u (which is even). For bignums, the
        // swapping is just pointer movement, and the subtraction
        // can be done in-place
        if (u > v) 
        {
            unsigned int t = v; v = u; u = t;
        }  // Swap u and v.
        
        v = v - u; // Here v >= u.
        
    } while (v != 0);

    // Restore common factors of 2
    return u << shift;
}

int main (int argc, char *argv[]) 
{
    int finalNumerator = 1;
    int finalDenominator = 1;
    
    // The numerator and the denominator will both have two digits
    // The quotient will always be less than one, so we can shorten the inner loop
    for (int i = 10; i < 100; i++)
    {
        for (int j = i; j < 100; j++)
        {
            double quotient = static_cast<double>(i) / static_cast<double>(j);
            
            int ib = i % 10;
            int ia = (i / 10) % 10;
            
            int jb = j % 10;
            int ja = (j / 10) % 10;
            
            bool foundMatch = false;
            double secondQuotient = 0.0;
            
            if (ia == ja)
            {
                foundMatch = true;
                secondQuotient = ComputeSecondQuotient (ib, jb);
            }
                
            if (ib == jb)
            {
                foundMatch = true;
                secondQuotient = ComputeSecondQuotient (ia, ja);
            }
                
            if (ia == jb)
            {
                foundMatch = true;
                secondQuotient = ComputeSecondQuotient (ib, ja);
            }
                
            if (ib == ja)
            {
                foundMatch = true;
                secondQuotient = ComputeSecondQuotient (ia, jb);
            }

            // Continue to next iteration if we didn't find a match
            if (!foundMatch)
                continue;
                
            // Eliminate trivial cases
            if (ib == 0 && jb == 0)
               continue;

            if (quotient == secondQuotient)
            {
                finalNumerator *= i;
                finalDenominator *= j;
            }
        }
    }
    
    std::cout << finalNumerator << " / " << finalDenominator << std::endl;
    
    int answer = finalDenominator / GreatestCommonDivisor (finalNumerator, finalDenominator);
    std::cout << "Final answer: " << answer << std::endl;
}