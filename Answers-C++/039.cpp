// Project Euler Problem 39
//
// If p is the perimeter of a right angle triangle with integral 
// length sides, {a,b,c}, there are exactly three solutions for p = 120.
//
// {20,48,52}, {24,45,51}, {30,40,50}
//
// For which value of p ≤ 1000, is the number of solutions maximised?
//
// Answer: 840

#include <iostream>

namespace
{
    const int MAXIMUM_VALUE = 1000;
    const int SMALLEST_TRIANGLE_SUM = 12;
}

int main (int argc, char *argv[]) 
{
    int maximumSolutionsAt = 0;
    int maximumSolutionCount = 0;
    
    for (int i = SMALLEST_TRIANGLE_SUM; i < MAXIMUM_VALUE; i++)
    {
        int solutionCount = 0;
        
        // We start at one because that is the smallest size we can have
        // for the triangle. We end at i-2 because the other sides of the
        // triangle have this minimum size as well.
        for (int a = 1; a < i-2; a++)
        {
            // One is again the smallest size possible. The maximum size
            // is i-a-1, since it will be the total minus the first side
            // and the hypotaneuse can be one (but it never will be).
            for (int b = 1; b < i-a-1; b++)
            {
                // Use Pythagorean Theorem to determine if we have a solution
                int legsValue = a*a + b*b;
                int hypotaneuseValue = (i - a - b) * (i - a - b);
                
                if (legsValue == hypotaneuseValue)
                    solutionCount++;
            }
        }

        if (solutionCount > maximumSolutionCount)
        {
            maximumSolutionsAt = i;
            maximumSolutionCount = solutionCount;
        }
    }
    
    std::cout << "The number of solutions is maximized at: " << maximumSolutionsAt << std::endl;
    std::cout << "The number of solutions was: " << maximumSolutionCount << std::endl;
}