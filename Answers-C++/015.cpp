// Probject Euler Problem 15
//
// Starting in the top left corner of a 2×2 grid, and only being able 
// to move to the right and down, there are exactly 6 routes to the bottom right corner.
//
// How many such routes are there through a 20×20 grid?
//
// Answer: 137846528820

#include <iostream>

// This is a Pascal's Triangle problem
// https://en.wikipedia.org/wiki/Pascal%27s_triangle

namespace
{
    const int TARGET_GRID_SIZE = 20;
}

long long SquarePaths (const int gridSize)
{
    // Add one since the first row and column of the square
    // are the seed values for the actual grid of numbers
    int depth = gridSize + 1;
    
    long long square[depth][depth];
    
    // Initialize the entire array
    for (int i = 0; i < depth; i++)
        for (int j = 0; j < depth; j++)
            square[i][j] = 0;
    
    // Insert first seed row and column
    for (int k = 0; k < depth; k++)
    {
        square[k][0] = 1;
        square[0][k] = 1;
    }
    
    // Now, calculate the rest of the square
    for (int m = 1; m < depth; m++)
    {
        for (int n = 1; n < depth; n++)
        {
            square[m][n] = square[m-1][n] + square[m][n-1];
        }
    }
    
    return square[depth-1][depth-1];
}

int main (int argc, char *argv[]) 
{
    long long answer = SquarePaths (TARGET_GRID_SIZE);
    
    std::cout << "The number of routes is: " << answer << std::endl;
}