#!/usr/bin/python

# Project Euler Problem 35
#
# The number, 197, is called a circular prime because all rotations 
# of the digits: 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes below 100: 
# 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
# How many circular primes are there below one million?
#
# Answer: 55

import math

MAXIMUM_VALUE = 1000000

#
# Sieve of Eratosthenes
# Simple, ancient algorithm for finding all prime numbers up to any given limit.
# It does so by iteratively marking as composite (i.e., not prime) the multiples
# of each prime, starting with the multiples of 2.
#
def GetPrimes (maximum):
	# There are no primes less than 2
	if (maximum < 2):
		return
	
	# Construct and execute the Sieve
	sqrtMaximum = math.sqrt(maximum)
	primes = []
	primeTracker = []
	
	for i in range(maximum):
		primeTracker.append(True)
	
	for i in range (2, int(sqrtMaximum)):
		if (primeTracker[i] == False):
			continue
		
		for j in range (i+i, maximum, i):
			primeTracker[j] = False
			
	return primeTracker

# Moves the first character in a string to the end of the string
# This rotates the number, which is useful when looking for circular primes
def RotateNumber(input):
	return input[1:] + input[0]

# Find the number of circular primes between 2 and an upper bound
primes = GetPrimes(MAXIMUM_VALUE)
primeCount = 0

for i in range(2,MAXIMUM_VALUE):
	# Is this number prime?
	if (not primes[i]):
		continue
	
	# Convert number to string for permutation
	stringValue = str(i)
	isCircularPrime = True;
	
	# Determine if each rotation is prime
	for j in range(0, len(stringValue)):
		permutationValue = int(stringValue)

		if (not primes[permutationValue]):
			isCircularPrime = False;
			
		stringValue = RotateNumber(stringValue)
	
	if (isCircularPrime):
		primeCount += 1

print ("The count of circular primes is: ", primeCount)
