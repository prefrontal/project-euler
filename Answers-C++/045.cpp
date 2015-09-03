// Project Euler Problem 45
//
// Triangle, pentagonal, and hexagonal numbers are generated by the following formulae:
// 
// Triangle        Tn=n(n+1)/2      1, 3, 6, 10, 15, ...
// Pentagonal      Pn=n(3n−1)/2     1, 5, 12, 22, 35, ...
// Hexagonal       Hn=n(2n−1)       1, 6, 15, 28, 45, ...
//
// It can be verified that T285 = P165 = H143 = 40755.
//
// Find the next triangle number that is also pentagonal and hexagonal.
//
// Answer: 1533776805

#include <cmath>
#include <iostream>

namespace
{
    const int START_INDEX = 143;
}

// Determine if a number is pentagonal
bool IsPentagonal (const long long input)
{
    double temp = (sqrt(1 + 24 * input) + 1.0) / 6.0;
    return temp == static_cast<long long>(temp);
}

int CalculateHexagonal (const int input)
{
    return input * (2 * input - 1);
}

// After some reading, one optimization that cane be made is to only check hexagonal numbers
// since every hexagonal number is also a triangle number.  We use that strategy here.
// We have to use long long since the values get so high - wrong answer if you don't!

int main (int argc, char *argv[]) 
{
    long long matchAnswer = 0;
    int index = START_INDEX;
    
    while (true)
    {
        index++;
        long long result = CalculateHexagonal (index);
        
        if (IsPentagonal(result))
        {
            matchAnswer = result;
            break;
        }
    }
    
    std::cout << "The next triangle number that is also pentagonal and hexagonal is: " << matchAnswer << std::endl;
}