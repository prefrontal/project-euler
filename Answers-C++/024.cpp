// Project Euler Problem 24
//
// A permutation is an ordered arrangement of objects. For example, 
// 3124 is one possible permutation of the digits 1, 2, 3 and 4. If 
// all of the permutations are listed numerically or alphabetically, 
// we call it lexicographic order. 
// The lexicographic permutations of 0, 1 and 2 are:
// 
// 012   021   102   120   201   210
// 
// What is the millionth lexicographic permutation of the 
// digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
// 
// Answer: 2783915460

#include <algorithm>
#include <iostream>

namespace
{
    const int PERMUTATION_TARGET = 1000000;
}

int main (int argc, char *argv[]) 
{
    // This is the first lexicographic permutation
    int digits[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    
    // Initial value is first permutation
    int permutationCount = 1;
    
    while (permutationCount < PERMUTATION_TARGET)
    {
        // Cheating a bit here by using std::next_permutation
        // Anything in the Standard Library is fair game though
        std::next_permutation (digits, digits+10);    
        permutationCount++;
    }
    
    std::cout << "Permutation value is: ";
    
    for (int i = 0; i < 10; i++) 
        std::cout << digits[i];
    
    std::cout << std::endl;
}