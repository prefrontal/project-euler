// Project Euler Problem 21
//
// Using names.txt, a 46K text file containing over five-thousand first names, 
// begin by sorting it into alphabetical order. Then working out the alphabetical 
// value for each name, multiply this value by its alphabetical position in the 
// list to obtain a name score.
// 
// For example, when the list is sorted into alphabetical order, COLIN, which is 
// worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would 
// obtain a score of 938 × 53 = 49714.
// 
// What is the total of all the name scores in the file?

#include <algorithm>
#include <fstream>
#include <iostream>
#include <vector>

namespace
{
	const int ASCII_LETTER_OFFSET = 64;
	const int ASCII_QUOTE_VALUE = 34;	
}

// The file provided is a single line of text consisting of names
// in quotes separated by commas.  This function will put one name
// in quotes in each element of the output vector
std::vector<std::string> LoadFile ()
{
	std::vector<std::string> names;
	std::string line;
	
	std::ifstream infile ("../Data Files/022-Names.txt");

	while (getline(infile, line, ','))
		names.push_back (line);
	
	return names;
}

int main (int argc, char *argv[]) 
{
	// Get names and sort them
	std::vector<std::string> names = LoadFile();
	std::sort (names.begin(), names.end());
	
	int finalSum = 0;
	
	// Iterate over the names, calculating the contribution
	// of each name, multiplied by its position in the list
	for (int i = 0; i < names.size(); i++)
	{
		std::string temp = names[i];
		int tempSum = 0;
		
		for (int j = 0; j < temp.length(); j++)
		{
			if (ASCII_QUOTE_VALUE == temp[j])
				continue;
					
			tempSum += temp[j] - ASCII_LETTER_OFFSET;	
		}
		
		// Increment by one because element 0 is the first entry
		finalSum += (i+1) * tempSum;
	}
	
	std::cout << "The final sum is: " << finalSum << std::endl;
}





