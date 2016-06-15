#!/usr/bin/python

# Project Euler Problem 36
#
# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
#
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# 
# (Please note that the palindromic number, in either base, may not include leading zeros.)
#
# Answer: 872187

import sys 

MAXIMUM_VALUE = 1000000

#
# Determines if an integer is a decimal palindrome through string comparison 
#
def IsDecimalPalindrome (value):
	# Convert the integer to a string
	# Reverse the string and compare to the original
	forward = str(value)
	reverse = forward[::-1]
	
	if (forward == reverse):
		return True

	return False

#
# Determines if a 32-bit integer is a binary palindrome through string comparison 
#
def IsBinaryPalindrome (input):
	forward = ""
	
	# Start at highest-order bit of int
	position = (sys.getsizeof(0) * 8) - 1;
	
	# Determine the position of the first non-zero character
	while (position >= 0):
		positionValue = (input & ( 1 << position )) >> position
		
		if (positionValue == 1):
			break
			
		position -= 1
	
	# Now load the stringstream with the remaining digits
	while (position >= 0):
		positionValue = (input & ( 1 << position )) >> position
		forward += str(positionValue)
		position -= 1
	
	reverse = forward[::-1]
	
	if (forward == reverse):
		return True

	return False

finalSum = 0

for i in range(0, MAXIMUM_VALUE):
	if (IsDecimalPalindrome(i) and IsBinaryPalindrome(i)):
		finalSum += i

print ("The final sum is: ", finalSum)
