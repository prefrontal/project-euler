# Probject Euler Problem 15, Ruby
#
# Starting in the top left corner of a 2×2 grid, and only being able 
# to move to the right and down, there are exactly 6 routes to the bottom right corner.
#
# How many such routes are there through a 20×20 grid?
#
# Answer: 137846528820

# This is a Pascal's Triangle problem
# https:#en.wikipedia.org/wiki/Pascal%27s_triangle

TARGET_GRID_SIZE = 20;

def SquarePaths (gridSize)
	# Add one since the first row and column of the square
	# are the seed values for the actual grid of numbers
	depth = gridSize + 1;
	
	square = Array.new(depth,Array.new(depth))
	
	# Initialize the entire array
	for i in 0...depth
		for j in 0...depth
			square[i][j] = 0
		end
	end
	
	# Insert first seed row and column
	for k in 0...depth
		square[k][0] = 1
		square[0][k] = 1
	end
	
	# Now, calculate the rest of the square
	for m in 1...depth
		for n in 1...depth
			square[m][n] = square[m-1][n] + square[m][n-1]
		end
	end
	
	return square[depth-1][depth-1]
end

answer = SquarePaths (TARGET_GRID_SIZE)

puts "The number of routes is: #{answer}"