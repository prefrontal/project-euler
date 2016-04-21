# Project Euler Problem 28, Ruby
#
# Starting with the number 1 and moving to the right in a 
# clockwise direction a 5 by 5 spiral is formed as follows:
# 
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
# 
# It can be verified that the sum of the numbers on the diagonals is 101.
# 
# What is the sum of the numbers on the diagonals in 
# a 1001 by 1001 spiral formed in the same way?
#
# Answer: 669171001

SQUARE_SIZE = 1001

square = Array.new(SQUARE_SIZE) {Array.new(SQUARE_SIZE,0)}

# Generate the values for the square
x = 0
y = SQUARE_SIZE-1

value = SQUARE_SIZE * SQUARE_SIZE;

square[x][y] = value;

while (value > 1)
	# Top Row
	while ((y-1 >= 0) && (square[x][y-1] == 0))
		y -= 1
		value -= 1
		square[x][y] = value
	end
	
	# Left Column
	while ((x+1 < SQUARE_SIZE) && (square[x+1][y] == 0))

		x += 1
		value -= 1
		square[x][y] = value
	end

	# Bottom Row
	while ((y+1 < SQUARE_SIZE) && (square[x][y+1] == 0))
		y += 1
		value -= 1
		square[x][y] = value
	end
	
	# Right Column
	while ((x-1 >= 0) && (square[x-1][y] == 0))
		x -= 1
		value -= 1
		square[x][y] = value
	end
end

# Create a sum of the diagonal values
diagonalSum = 0

for i in 0...SQUARE_SIZE
	diagonalSum += square[i][i] # First diagonal
	diagonalSum += square[SQUARE_SIZE-i-1][i] # Second diagonal
end           

# Correct for the center value getting counted twice
diagonalSum -= 1;
	
puts "The final diagonal sum is: #{diagonalSum}"
