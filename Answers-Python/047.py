#!/usr/bin/python

# Project Euler Problem 47
#
# The first two consecutive numbers to have two distinct prime factors are:
# 
# 14 = 2 x 7
# 15 = 3 x 5
# 
# The first three consecutive numbers to have three distinct prime factors are:
# 
# 644 = 2^2 x 7 x 23
# 645 = 3 x 5 x 43
# 646 = 2 x 17 x 19.
# 
# Find the first four consecutive integers to have four distinct prime factors. 
# What is the first of these numbers?
#
# Answer: 134043

import math

TARGET_FACTOR_COUNT = 4
TARGET_RUN_LENGTH = 4
MAXIMUM_VALUE = 150000

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
	
	# Generate the list of primes to return
	for k in range (2, maximum):
		if (primeTracker[k] == True):
			primes.append(k)
			
	return primes


#
# Get a list of the prime factors of a given integer
# This function expects to have a valid list of primes passed in
#
def GetPrimeFactors (number, primes):
	factorCount = 0
	lastFactor = 0
	remainder = number
	
	# Keep looping until we reach the end of our dividing
	while (remainder != 1 ):
		# Determine the lowest prime that we can use to divide the remainder
		for i in range(0, len(primes)):
			if (remainder <= 1): # Sanity check
				break
			
			# Found a prime factor
			if (0 == remainder % primes[i]):
				# If the current factor is the same as
				# the last one then don't count it
				if (primes[i] != lastFactor):
					factorCount += 1
					lastFactor = primes[i]

				remainder /= primes[i]
				break

	return factorCount


# We are using brute force for the prime factor search
# This takes about sixteen seconds on my machine
# There are clearly some ways that we could speed this up

primes = GetPrimes (MAXIMUM_VALUE)

leadValue = 0
consecutivePrimeCount = 0

# Examine all integers up to the maximum value
# Start at one so we don't try to factor zero
for i in range(1, MAXIMUM_VALUE):
	factorCount = GetPrimeFactors(i, primes)
	
	# Reset the counter if we didn't get the right number of factors
	if (factorCount != TARGET_FACTOR_COUNT):
		consecutivePrimeCount = 0
		continue
	
	# If this is the first in a new potential sequence 
	# then keep track of the lead integer value
	if (consecutivePrimeCount == 0):
		leadValue = i
	
	consecutivePrimeCount += 1
	
	# Determine if we have found the target run
	if (consecutivePrimeCount == TARGET_RUN_LENGTH):
		break

print ("The target integer is: ", leadValue)