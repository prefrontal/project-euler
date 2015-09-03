// Project Euler Problem 44
//
// Pentagonal numbers are generated by the formula, Pn=n(3n−1)/2. 
// The first ten pentagonal numbers are:
// 
// 1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
// 
// It can be seen that P4 + P7 = 22 + 70 = 92 = P8. 
// However, their difference, 70 − 22 = 48, is not pentagonal.
// 
// Find the pair of pentagonal numbers, Pj and Pk, for which 
// their sum and difference are pentagonal and D = |Pk − Pj| 
// is minimised; what is the value of D?
//
// Answer: 5482660

#include <cmath>
#include <iostream>
#include <vector>

namespace
{
    const int MAXIMUM_VALUE = 5000;
}

// Calculates a pentagonal number from an input integer
int CalculatePentagonal (const int input)
{
    return (input * (3*input - 1) / 2);
}

// Find all pentagonal numbers starting with one 
// and going to a predetermined maximum value
std::vector<int> FindPentagonalNumbers (const int maximum)
{
    std::vector<int> numbers;
    
    for (int i = 1; i <= maximum; i++)
        numbers.push_back (CalculatePentagonal(i));

    return numbers;
}

// Determine if a number is pentagonal
bool IsPentagonal (const int input)
{
    double temp = (sqrt(1 + 24 * input) + 1.0) / 6.0;
    return temp == static_cast<int>(temp);
}

int main (int argc, char *argv[]) 
{
    int finalAnswer = 0;
    
    std::vector<int> numbers = FindPentagonalNumbers (MAXIMUM_VALUE);
    
    for (int i = 0; i < MAXIMUM_VALUE; i++) // Outer loop
    {
        for (int j = i; j < MAXIMUM_VALUE; j++) // Inner loop
        {
            const int sum = numbers[i] + numbers[j];
            const int difference = numbers[j] - numbers[i];
                        
            if (IsPentagonal(sum) && IsPentagonal(difference))
                finalAnswer = std::abs(CalculatePentagonal(j+1) - CalculatePentagonal(i+1));
        }
    }
    
    std::cout << "The final answer is: " << finalAnswer << std::endl;
    
}