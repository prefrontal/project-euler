#!/usr/bin/python

# Project Euler Problem 63
#
# The 5-digit number, 16807=7^5, is also a fifth power. Similarly, 
# the 9-digit number, 134217728=8^9, is a ninth power.
#
# How many n-digit positive integers exist which are also an nth power?
#
# Answer: 49

# Run through all the combinations until the number length exceeds the 
# power value. This solution crashes at the end when it hits the string
# conversion limit of 4300 chars, but it provides the right answer.

power = 1
count = 0

# Outer loop handles the increase in power integer
while True:
	base = 1
	
	# Inner loop handles the base values
	while True:
		result = base ** power
		length = len(str(result))
		
		if power == length:
			count += 1
		elif power < length:
			break
			
		base += 1
	
	print("Power: ", power, " Count:", count, " ")
	power += 1