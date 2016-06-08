#!/usr/bin/python

# Project Euler Problem 20
#
# n! means n × (n − 1) × ... × 3 × 2 × 1
#
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!
#
# Answer: 648

FACTORIAL_NUMBER = 100
NUMBER_ARRAY_SIZE = 200

# So, 100! = 9.332622e+157. We will need to do something clever here.

# Use an integer array to hold the large number
# Init first element to one so we can multiply later
bigNumber = [0 for x in range(NUMBER_ARRAY_SIZE)]
bigNumber[0] = 1

for i in range (1,FACTORIAL_NUMBER+1):
	carryOver = 0
	
	for j in range(NUMBER_ARRAY_SIZE):
		temp = (bigNumber[j] * i) + carryOver
		bigNumber[j] = temp % 10
		carryOver = int(temp/10)

finalSum = 0

for t in range(NUMBER_ARRAY_SIZE):
	finalSum += bigNumber[t]

print ("The final sum is: ", finalSum)