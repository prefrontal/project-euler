// Project Euler Problem 38
//
// Take the number 192 and multiply it by each of 1, 2, and 3:
//
// 192 × 1 = 192
// 192 × 2 = 384
// 192 × 3 = 576
//
// By concatenating each product we get the 1 to 9 pandigital, 192384576. 
// We will call 192384576 the concatenated product of 192 and (1,2,3)
// 
// The same can be achieved by starting with 9 and multiplying by 
// 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is 
// the concatenated product of 9 and (1,2,3,4,5).
// 
// What is the largest 1 to 9 pandigital 9-digit number that can be formed 
// as the concatenated product of an integer with (1,2, ... , n) where n > 1?
//
// Answer: 932718654

#include <algorithm>
#include <iostream>
#include <sstream>
#include <string>

namespace
{
    const int MAXIMUM_VALUE = 100000;
    const int PANDIGITAL_VALUE_COUNT = 9;
}

// Determine if a string contains a pandigital number
bool IsPandigital (const std::string input)
{
    std::string temp = input;
    std::sort (temp.begin(), temp.end());
    
    if (0 == temp.compare ("123456789"))
        return true;
    else
        return false;
}

// Return the number of characters in an integer
int GetIntegerLength (const int input)
{
    int length = 0;
    int temp = input;
    
    while (temp > 0)
    {
        temp /= 10;
        length++;
    }
    
    return length;
}

// Determine the largest concatenated pandigital from integer multiplication
int main (int argc, char *argv[]) 
{
    int largestPandigital = 0;
    
    for (int i = 1; i < MAXIMUM_VALUE; i++)
    {
        std::stringstream ss;
        
        int multiplier = 0;
        int valueCount = 0;
        
        // Keep multiplying the base integer until we have
        // more digits than a standard pandigital number.
        // The use of stringstreams makes things easier here.
        while (valueCount < PANDIGITAL_VALUE_COUNT)
        {
            // Concatenate the next number
            multiplier += 1;
            ss << (i*multiplier);
            valueCount = ss.tellp();
            
            // Test the number for pandigitality
            if ( IsPandigital(ss.str()) )
            {
                int pandigitalValue = 0;
                ss >> pandigitalValue;
                
                if (pandigitalValue > largestPandigital)
                    largestPandigital = pandigitalValue;
            }
        }
    }

    std::cout << "The largest pandigital is: " << largestPandigital << std::endl;
}