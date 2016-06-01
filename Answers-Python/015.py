#!/usr/bin/python

# Probject Euler Problem 15
#
# Starting in the top left corner of a 2x2 grid, and only being able 
# to move to the right and down, there are exactly 6 routes to the bottom right corner.
#
# How many such routes are there through a 20x20 grid?
#
# Answer: 137846528820

# This is a Pascal's Triangle problem
# https:#en.wikipedia.org/wiki/Pascal%27s_triangle

TARGET_GRID_SIZE = 20

def SquarePaths (gridSize):
	# Add one since the first row and column of the square
	# are the seed values for the actual grid of numbers
	depth = gridSize + 1
	
	square = []
	
	# Initialize the entire array
	for i in range (0,depth):
		square.append([])
		for j in range (0,depth):
			square[i].append(0)
	
	# Insert first seed row and column
	for k in range (0,depth):
		square[k][0] = 1
		square[0][k] = 1
	
	# Now, calculate the rest of the square
	for m in range (1, depth):
		for n in range (1, depth):
			square[m][n] = square[m-1][n] + square[m][n-1]
	
	return square[depth-1][depth-1];

answer = SquarePaths (TARGET_GRID_SIZE)

print "The number of routes is: %d" % answer