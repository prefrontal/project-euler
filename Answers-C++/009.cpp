// Project Euler Problem 9
//
// A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
// a2 + b2 = c2
// For example, 32 + 42 = 9 + 16 = 25 = 52.
// There exists exactly one Pythagorean triplet for which a + b + c = 1000.
// Find the product abc.
// Answer: 31875000

#include <iostream>

namespace
{
    const int TARGET_SUM = 1000;
}

int main(int argc, char *argv[]) 
{
    int pySum = 0;
    int a,b,c = 0;

    for (int i = TARGET_SUM; i > 0; i--)
    {
        for (int j = (TARGET_SUM-i); j > 0; j--)
        {
            for (int k = (TARGET_SUM-i-j); k > 0; k--)
            {
                if ((i+j+k) != TARGET_SUM)
                    continue;
                
                if ((i*i + j*j) != k*k)
                    continue;
                    
                pySum = i*j*k;
            }
        }
    }
    
    std::cout << "The product is: " << pySum << std::endl;
}