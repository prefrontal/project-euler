#!/usr/bin/python

# Project Euler, Problem 003
#
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?
# Answer: 6857

import math

TARGET_NUMBER = 600851475143

def IsPrime (input):
	if (input < 2):
		return False
	
	primeState = True
	
	for i in range (2, input):
		if ((input % i) == 0):
			primeState = False
			break

	return primeState

def DetermineLargestPrimeFactor (inputValue):
	largestFactor = 0
	sqrtInput = math.sqrt(inputValue)

	for i in range (3, int(sqrtInput), 2):
		if ((inputValue % i) == 0):
			if (IsPrime(i)):
				 if (i > largestFactor):
					largestFactor = i 
	
	return largestFactor;

factor = DetermineLargestPrimeFactor(TARGET_NUMBER)
print "Largest prime factor: %d" % factor

