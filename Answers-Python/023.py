#!/usr/bin/python

# Project Euler Problem 23
#
# A perfect number is a number for which the sum of its proper divisors is 
# exactly equal to the number. For example, the sum of the proper divisors of
# 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less 
# than n and it is called abundant if this sum exceeds n.
# 
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest 
# number that can be written as the sum of two abundant numbers is 24. By mathematical 
# analysis, it can be shown that all integers greater than 28123 can be written as 
# the sum of two abundant numbers. However, this upper limit cannot be reduced any 
# further by analysis even though it is known that the greatest number that cannot be 
# expressed as the sum of two abundant numbers is less than this limit.
# 
# Find the sum of all the positive integers which cannot be 
# written as the sum of two abundant numbers.
#
# Answer: 4179871
	
MAX_INTEGER = 28123

# Brute-force determination of numeric abundance
def IsAbundant (value):
	divisors = []
	
	for i in range(1,value):
		if (0 == value % i):
			divisors.append(i)
	
	divisorSum = 0
	
	for it in divisors:
		divisorSum += it

	if (value < divisorSum):
		return True
	else:
		return False
		

abundantNumbers = []
numberList = [False for x in range(MAX_INTEGER+1)]

# First, generate a list of abundant numbers
for i in range(12, MAX_INTEGER):
	if (IsAbundant (i)):
		abundantNumbers.append(i)

# Next, add each abundant number to every other possible
# abundant number in the vector.
for m in range(len(abundantNumbers)):
	for n in range(len(abundantNumbers)):
		position = abundantNumbers[m] + abundantNumbers[n]
		if (position <= MAX_INTEGER):
			numberList[position] = True

# Go through the list of numbers that cannot be expressed as
# two abundant numbers and generate the final sum.
finalSum = 0

for i,v in enumerate(numberList):
	if (not v):
		finalSum += i

print ("The final sum is: ", finalSum)






