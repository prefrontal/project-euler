// Probject Euler Problem 15, Swift
//
// Starting in the top left corner of a 2×2 grid, and only being able 
// to move to the right and down, there are exactly 6 routes to the bottom right corner.
//
// How many such routes are there through a 20×20 grid?
//
// Answer: 137846528820

// This is a Pascal's Triangle problem
// https://en.wikipedia.org/wiki/Pascal%27s_triangle

let TARGET_GRID_SIZE = 20;

func SquarePaths (gridSize:Int) -> Int64
{
	// Add one since the first row and column of the square
	// are the seed values for the actual grid of numbers
	let depth = gridSize + 1;
	
	var square = Array(count: depth, repeatedValue: Array(count: depth, repeatedValue: 0))
	
	// Initialize the entire array
	for (var i = 0; i < depth; i++)
	{
		for (var j = 0; j < depth; j++)
		{
			square[i][j] = 0;
		}
	}
	
	// Insert first seed row and column
	for (var k = 0; k < depth; k++)
	{
		square[k][0] = 1;
		square[0][k] = 1;
	}
	
	// Now, calculate the rest of the square
	for (var m = 1; m < depth; m++)
	{
		for (var n = 1; n < depth; n++)
		{
			square[m][n] = square[m-1][n] + square[m][n-1];
		}
	}
	
	return Int64(square[depth-1][depth-1]);
}

var answer:Int64 = SquarePaths (TARGET_GRID_SIZE);
	
print ("The number of routes is: \(answer)")