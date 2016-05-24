#!/usr/bin/python

# Project Euler Problem 5
#
# 2520 is the smallest number that can be divided by each of the numbers
# from 1 to 10 without any remainder. What is the smallest positive number 
# that is evenly divisible by all of the numbers from 1 to 20?
#
# Answer: 232792560

MAX_DIVISOR = 20

#
# Checks to see if a number is evenly divisible by all numbers between
# zero and a specified maximum divisor.
#
def IsEvenlyDivisible (value):
	if (value < MAX_DIVISOR):
		return False
	
	evenlyDivisible = True
	
	for i in range (MAX_DIVISOR, 0, -1):
		if (0 != (value % i)):
			evenlyDivisible = False
			break
		
	return evenlyDivisible

#
# Finds the smallest number that is evenly divisible
#
currentValue = MAX_DIVISOR

while (1):
	currentValue += 1
	
	if (0 == currentValue % 100000):
		print currentValue
	
	if (IsEvenlyDivisible(currentValue)):
		break

print "Smallest positive evenly divisible number: %d" % currentValue