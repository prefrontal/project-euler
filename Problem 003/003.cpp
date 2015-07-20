#include <cmath>
#include <iostream>
#include <vector>

// Project Euler, Problem 003
// Answer: 6857

namespace
{
    // Input parameters
    int64_t TARGET_NUMBER = 600851475143;
}

bool IsPrime (const int64_t input)
{
    if (input < 2)
        return false;
    
    bool primeState = true;
    
    for (int64_t i = 2; i < input; i++)
    {
        if ((input % i) == 0)
        {
            primeState = false;
            break;
        }
    }
    
    return primeState;
}

long DetermineLargestPrimeFactor (const int64_t inputValue)
{
    int64_t largestFactor = 0;
    int64_t sqrtInput = static_cast<int64_t>( sqrt(static_cast<long double>(inputValue)) );

    for (int64_t i = 3; i < sqrtInput; i += 2)
    {
        if ((inputValue % i) == 0)
        {
            if (IsPrime(i))
            {
                 if (i > largestFactor)
                    largestFactor = i;   
            }     
        }      
    }
    
    return largestFactor;
}

int main (int argc, char *argv[]) 
{
	int64_t factor = DetermineLargestPrimeFactor (TARGET_NUMBER);

	std::cout << "Largest prime factor: " << factor << std::endl;
}

