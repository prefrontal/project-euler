// Project Euler Problem 48
//
// The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
// 
// Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
//
// Answer: 9110846700

#include <iostream>

namespace
{
    const int MAXIMUM_VALUE = 1000;
    const long long MODULO_VALUE = 10000000000;
}

/* 
 *I brute-forced the problem in my initial implementation. After
 * some research online I learned more about properties of the modulo
 * operator. Specifically:
 * 
 *      (a*b) % c = ((a % c) * (b % c) )% c
 * and
 *      (a+b) % c = ((a % c) + (b % c) )% c
 *
 * These can be used to just operate on the last ten digits of the final
 * sum instead of the entire sequence of values, which becomes HUGE.
 */

// Find the last digits in the series to a defined precision
int main (int argc, char *argv[]) 
{
    long long result = 0;
    
    for (int i = 1; i <= MAXIMUM_VALUE; i++)
    {
        long long temp = i;
        
        for (int j = 1; j < i; j++)
        {
            temp *= i;
            temp %= MODULO_VALUE;
        }
        
        result += temp;
        result %= MODULO_VALUE;
    }
    
    std::cout << "The final sum is: " << result << std::endl;
}