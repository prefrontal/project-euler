#!/usr/bin/python

# Project Euler Problem 4
#
# A palindromic number reads the same both ways. 
# The largest palindrome made from the product of two 
# 2-digit numbers is 9009 = 91 × 99. Find the largest 
# palindrome made from the product of two 3-digit numbers.
#
# Answer: 906609

/*
 * Determines if an integer is a palindrome through string comparison 
 */
bool IsPalindrome (const int value)
{
    std::stringstream ss;
    ss << value;
    std::string forward = ss.str();
    std::string reverse;
    std::reverse_copy(forward.begin(), forward.end(), std::back_inserter(reverse));
    
    if (0 == forward.compare(reverse))
        return true;

    return false;
}

/*
 * Determines if an integer is a palindrome through integer manipulation
 */
bool IsPalindrome2 (const int value)
{
    int reversed = 0;
    int temp = value;
    
    while (temp != 0)
    {
        reversed *= 10;
        reversed += (temp % 10);
        temp /= 10;
    }
    
    if (value == reversed)
        return true;
        
    return false;
}

int main(int argc, char *argv[]) 
{
    int maxPalindrome = 0;
    
    for (int i = 100; i < 1000; ++i)
    {
        for (int j = 100; j < 1000; ++j)
        {
            if (!IsPalindrome2 (i * j))
                continue;
                 
            if ((i*j) > maxPalindrome)
                maxPalindrome = i * j;
        }
    }
    
    std::cout << "The largest palindrome is: " << maxPalindrome << std::endl;
    
}