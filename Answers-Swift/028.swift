// Project Euler Problem 28, Swift
//
// Starting with the number 1 and moving to the right in a 
// clockwise direction a 5 by 5 spiral is formed as follows:
// 
// 21 22 23 24 25
// 20  7  8  9 10
// 19  6  1  2 11
// 18  5  4  3 12
// 17 16 15 14 13
// 
// It can be verified that the sum of the numbers on the diagonals is 101.
// 
// What is the sum of the numbers on the diagonals in 
// a 1001 by 1001 spiral formed in the same way?
//
// Answer: 669171001

import Foundation

let SQUARE_SIZE = 1001;

var square:[[Int]] = [[Int]](count:SQUARE_SIZE, repeatedValue:Array(count:SQUARE_SIZE, repeatedValue:0))

// Generate the values for the square
var x:Int = 0;
var y:Int = SQUARE_SIZE-1;

var value:Int = SQUARE_SIZE * SQUARE_SIZE;

square[x][y] = value;

while (value > 1)
{
	// Top Row
	while ((y-1 >= 0) && (square[x][y-1] == 0))
	{
		y -= 1;
		value -= 1;
		square[x][y] = value;
	}  
	
	// Left Column
	while ((x+1 < SQUARE_SIZE) && (square[x+1][y] == 0))
	{
		x += 1;
		value -= 1;
		square[x][y] = value;
	}
	
	// Bottom Row
	while ((y+1 < SQUARE_SIZE) && (square[x][y+1] == 0))
	{
		y += 1;
		value -= 1;
		square[x][y] = value;
	}
	
	// Right Column
	while ((x-1 >= 0) && (square[x-1][y] == 0))
	{
		x -= 1;
		value -= 1;
		square[x][y] = value;
	}    
}

// Create a sum of the diagonal values
var diagonalSum:Int64 = 0;

for (var i:Int = 0; i < SQUARE_SIZE; i++)
{
	diagonalSum += square[i][i]; // First diagonal
	diagonalSum += square[SQUARE_SIZE-i-1][i]; // Second diagonal
}               

// Correct for the center value getting counted twice
diagonalSum -= 1;
	
print ("The final diagonal sum is: \(diagonalSum)")