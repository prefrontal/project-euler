#include <iostream>

// Project Euler, Problem 002
// Answer: 4613732

namespace
{
    // Input parameters
    int UPPER_LIMIT = 4000000;
}

int main(int argc, char *argv[]) 
{
    int oneBack = 2;
    int twoBack = 1;

    int sumTotal = 2;  // Starts at 2 since initial oneBack term is even
    
    while ((oneBack+twoBack) < UPPER_LIMIT)
    {
        // Determine next Fibonacci term
        int currentTerm = oneBack + twoBack;
        
        // Check for even number and add
        if ((currentTerm % 2) == 0)
            sumTotal += currentTerm;
           
        // Update Fibonacci terms
        twoBack = oneBack;
        oneBack = currentTerm;
    }
    
    std::cout << "Sum total: " << sumTotal << std::endl;
}