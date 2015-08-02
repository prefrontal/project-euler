// Project Euler Problem 6
//
// The sum of the squares of the first ten natural numbers is,
// 1^2 + 2^2 + ... + 10^2 = 385
// The square of the sum of the first ten natural numbers is,
// (1 + 2 + ... + 10)^2 = 55^2 = 3025
// Hence the difference between the sum of the squares of the first 
// ten natural numbers and the square of the sum is 3025 − 385 = 2640.
// Find the difference between the sum of the squares of the first 
// one hundred natural numbers and the square of the sum.
// Answer: 25164150

#include <iostream>

namespace
{
    const int MAX_EVALUATION_NUMBER = 100;
}

/*
 * Determines the difference between sum-of-suqares and 
 * square-of-sums for a range of numbers
 */
int main(int argc, char *argv[]) 
{
    int tempSum = 0;
    int tempSumSquares = 0;
    
    for (int i = 1; i <= MAX_EVALUATION_NUMBER; ++i)
    { 
        tempSum += i;
        tempSumSquares += i*i;
    }

    const int sumOfSquares = tempSumSquares;
    const int squareOfSums = tempSum * tempSum;
    const int difference = std::abs(sumOfSquares - squareOfSums);
    
    std::cout << "The difference is: " << difference << std::endl;
}