#!/usr/bin/python

# Project Euler Problem 206
#
# Find the unique positive integer whose square 
# has the form 1_2_3_4_5_6_7_8_9_0,
# where each "_" is a single digit.
#
# Answer: 1389019170

# Current implementation takes about 90s to complete
# Could probably be optimized further

result = 0

# Starting point is approximate square root
# of first possible number (1020304050607080900)
base = 1010101010

# Keep going until we find the number or we overflow
while (True):
	result = base * base
	found = True
	
	# Check every other digit in the number
	for i in range(10, 0, -1):
		if (result%10 != i%10):
			found = False
		
		result = int(result / 100)
	
	if (found):
		break
	
	base += 1

print ("The number is: ", base)	