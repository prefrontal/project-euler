// Project Euler Problem 14

// The following iterative sequence is defined for the set of positive integers:
//
// n → n/2 (n is even)
// n → 3n + 1 (n is odd)
//
// Using the rule above and starting with 13, we generate the following sequence:
//
// 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
//
// It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. 
// Although it has not been proved yet (Collatz Problem), it is thought that all starting 
// numbers finish at 1.
// Which starting number, under one million, produces the longest chain?
// NOTE: Once the chain starts the terms are allowed to go above one million.
// Answer: 

#include <iostream>

namespace
{
    const int UPPER_LIMIT = 1000000;
}

// Identify the longest Collatz chain from a range of numbers starting
// at one and going up to a specified upper limit
int main (int argc, char *argv[]) 
{
    int maxTermCount = 0;
    int maxTermLocation = 0;
    
    for (int i = 1; i <= UPPER_LIMIT; i++)
    {
        // Must use a 64-bit integer here, as we will overflow a 32-bit
        // integer once we hit a starting value of 113,383
        long long temp = i;
        int count = 0;
        
        while (temp != 1)
        {
            if (0 == (temp % 2))
                temp = temp / 2;
            else
                temp = 3 * temp + 1;
            
            count++;      
        }
        
        if (count > maxTermCount)
        {
            maxTermLocation = i;
            maxTermCount = count;                
        }    
        
    }    
    
    std::cout << "The maximum term count was " << maxTermCount << " at location " << maxTermLocation << std::endl;
}



