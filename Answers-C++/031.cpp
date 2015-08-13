// Project Euler Problem 31
//
// In England the currency is made up of pound, £, and pence, p, 
// and there are eight coins in general circulation:
// 
// 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
//
// It is possible to make £2 in the following way:
// 
// 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
//
// How many different ways can £2 be made using any number of coins?
//
// Answer: 73682

#include <iostream>

namespace
{
    const int TARGET_VALUE = 200;
}

int main (int argc, char *argv[]) 
{
    int coinValues[8] = {1, 2, 5, 10, 20, 50, 100, 200};
    
    int finalCount = 0;
    
    // Seven nested for loops isn't pretty, but it gets the job done
    for (int a = 0; a <= 200; a++)
        for (int b = 0; b <= 100; b++)
            for (int c = 0; c <= 40; c++)
                for (int d = 0; d <= 20; d++)
                    for (int e = 0; e <= 10; e++)
                        for (int f = 0; f <= 4; f++)
                            for (int g = 0; g <= 2; g++)
                                {
                                    int temp = a + 2*b + 5*c + 10*d + 20*e + 50*f + 100*g;
                                    
                                    if (temp == TARGET_VALUE)
                                        finalCount++;
                                }
    
    // Add one for the £2 coin. Done to keep it out of the nested loops.
    finalCount += 1;
    
    std::cout << "The number of ways to make £2 is: " << finalCount << std::endl;
}