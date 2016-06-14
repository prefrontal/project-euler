#!/usr/bin/python

# Project Euler Problem 30
#
# Surprisingly there are only three numbers that can be written 
# as the sum of fourth powers of their digits:
# 
# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4
# As 1 = 1^4 is not a sum it is not included.
# 
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
# 
# Find the sum of all the numbers that can be written as 
# the sum of fifth powers of their digits.
#
# Answer: 443839

MAXIMUM_SEARCH_VALUE = 999999
MINIMUM_SEARCH_VALUE = 2
EXPONENT = 5

overallSum = 0

# Go through all possible number in the range and evaluate if the
# power of their digits is equal to the original number provided
for i in range(MINIMUM_SEARCH_VALUE, MAXIMUM_SEARCH_VALUE+1):
	tempSum = 0
	number = i

	while (number > 0):
		tempSum += pow (number%10, EXPONENT) 
		number /= 10
	
	if (tempSum == i):
		overallSum += i

print ("The overall sum is: %s" % overallSum)