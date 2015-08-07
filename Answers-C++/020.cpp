// Project Euler Problem 20
//
// n! means n × (n − 1) × ... × 3 × 2 × 1
//
// For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
// and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
//
// Find the sum of the digits in the number 100!
//
// Answer: 648

#include <iostream>

namespace
{
    const int FACTORIAL_NUMBER = 100;
    const int NUMBER_ARRAY_SIZE = 200;
}

// So, 100! = 9.332622e+157. We will need to do something clever here.

int main (int argc, char *argv[]) 
{
    // Use an integer array to hold the large number
    // Init first element to one so we can multiply later
    int bigNumber[NUMBER_ARRAY_SIZE] = {};
    bigNumber[0] = 1;
    
    for (int i = 1; i <= FACTORIAL_NUMBER; i++) // Factorial loop
    {
        int carryOver = 0;
        
        for (int j = 0; j < NUMBER_ARRAY_SIZE; j++) // Array loop
        {
            int temp = (bigNumber[j] * i) + carryOver;
            bigNumber[j] = temp % 10;
            carryOver = static_cast<int>(temp/10);
        }
    }
    
    int finalSum = 0;
    
    for (int t = 0; t < NUMBER_ARRAY_SIZE; t++)
        finalSum += bigNumber[t];
    
    std::cout << "The final sum is: " << finalSum << std::endl;
}