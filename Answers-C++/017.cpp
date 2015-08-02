// Project Euler Problem 17
//
// If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
// then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
//
// If all the numbers from 1 to 1000 (one thousand) inclusive were 
// written out in words, how many letters would be used?
// 
// NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) 
// contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use 
// of "and" when writing out numbers is in compliance with British usage.
//
// Answer: 21124

#include <math.h>

#include <iostream>

namespace
{
    const int NUMBER_LIMIT = 1000;
}

/*
 * Turns a single digit number into an English word
 */
std::string DigitToPhrase (const int number)
{
    std::string finalPhrase;
    
    if ((number < 0) || (10 < number))
            return finalPhrase;
    
    const std::string digitLookupTable[] = {"", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};

    return digitLookupTable[number];
}

/*
 * Generates an English phrase from an arbitrary number under 10,000
 * Does not add spaces, since they do not count in the final tally
 */
std::string GenerateEnglishString (const int number)
{
    std::string finalString;
    int tempNumber = number;
    
    // Determine the digits we will be working with
    const int thousands = floor(tempNumber/1000);
    tempNumber %= 1000;
    const int hundreds = floor(tempNumber/100);
    tempNumber %= 100;
    const int tens = floor(tempNumber/10);
    tempNumber %= 10;
    const int ones = tempNumber;
    
    // Generate the output string using the known digits
    if (0 < thousands)
        finalString += DigitToPhrase (thousands) + "thousand";

    if (0 < hundreds)
        finalString += DigitToPhrase (hundreds) + "hundred";
    
    if ((0 < thousands + hundreds) && (0 != tens + ones))
        finalString += "and";
        
    if ((2 <= tens) && (tens <= 9))
    {
        const std::string tensLookupTable[] = {"", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};
        finalString += tensLookupTable[tens];
        finalString += DigitToPhrase (ones);
    }
    else if (1 == tens)
    {
        const std::string teensLookupTable[] = {"ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};
        finalString += teensLookupTable[ones];
    }
    else if (0 == tens)
        finalString += DigitToPhrase (ones);
        
    return finalString;
}

/*
 * Determine the number of characters in an English language description
 * of a range of numbers.
 */ 
int main(int argc, char *argv[]) 
{
    int sum = 0;
    
    for (int i = 1; i <= NUMBER_LIMIT; i++)
    {
        std::string temp = GenerateEnglishString (i);
        std::cout << i << " - " << temp << std::endl;
        sum += temp.length();
    }
    
    std::cout << std::endl << "The final letter count is: " << sum << std::endl;
}