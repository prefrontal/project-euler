// Project Euler Problem 42
//
// The nth term of the sequence of triangle numbers is given by, 
// tn = ½n(n+1); so the first ten triangle numbers are:
//
// 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
// 
// By converting each letter in a word to a number corresponding 
// to its alphabetical position and adding these values we form a 
// word value. For example, the word value for SKY is 
// 19 + 11 + 25 = 55 = t10. If the word value is a triangle number 
// then we shall call the word a triangle word.
// 
// Using words.txt (right click and 'Save Link/Target As...'), 
// a 16K text file containing nearly two-thousand common English 
// words, how many are triangle words?
//
// Answer: 162

#include <fstream>
#include <iostream>
#include <string>
#include <vector>

namespace
{
    const int ASCII_CAPITAL_OFFSET = 64;
}

// The file provided is a single line of text consisting of words
// in quotes separated by commas.  This function will put one name
// in quotes in each element of the output vector
std::vector<std::string> LoadFile ()
{
    std::vector<std::string> words;
    std::string line;
    
    std::ifstream infile ("../Data Files/042-Words.txt");

    while (getline(infile, line, ','))
        words.push_back (line);
    
    return words;
}

// Brute force determination of a triangle number
bool IsTriangleNumber (const int value)
{
    int triangleNumber = 1;
    int iteration = 1;
    
    // Keep calculating the next triangle iteration until
    // we either match or overshoot the input value
    while (triangleNumber <= value)
    {
        if (triangleNumber == value)
            return true;
            
        iteration++;
        triangleNumber = 0.5 * iteration * (iteration + 1);
    } 
    
    return false;
}

bool IsTriangleWord (const std::string input)
{
    // Don't modify the input variable
    std::string word = input;
    
    // Trim the quotes
    word.erase (word.begin());
    word.erase (word.end() - 1);
  
    int letterSum = 0;

    // Calculate the sume of letter representations
    for (int i = 0; i < word.size(); i++)
        letterSum += word[i] - ASCII_CAPITAL_OFFSET;
    
    if ( IsTriangleNumber(letterSum) )
        return true;
    else
        return false;
}

int main(int argc, char *argv[]) 
{
    int triangleWordCount = 0;
    
    std::vector<std::string> words = LoadFile();
    
    for (auto it = words.begin(); it < words.end(); it++)
    {
        if (IsTriangleWord(*it))
            triangleWordCount++;
    }
    
    std::cout << "The number of triangle words is: " << triangleWordCount << std::endl;
}