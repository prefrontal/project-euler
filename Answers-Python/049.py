#!/usr/bin/python

# Project Euler Problem 49
#
# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, 
# is unusual in two ways: 
# (i) each of the three terms are prime, and, 
# (ii) each of the 4-digit numbers are permutations of one another.
# 
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, 
# exhibiting this property, but there is one other 4-digit increasing sequence.
# 
# What 12-digit number do you form by concatenating the three terms in this sequence?
# 
# Answer: 2969 6299 9629

import math

# We will be working with four-digit integers
MINIMUM_VALUE = 1000
MAXIMUM_VALUE = 9999

# This is the value we already know
GIVEN_VALUE = 1487

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

def IsPrime (input):
	if (input < 2):
		return False
	
	primeState = True
	
	for i in range (2, input):
		if ((input % i) == 0):
			primeState = False
			break

	return primeState

def next_permutation (array):
	# Find non-increasing suffix
	i = len(array) - 1
	
	while (i > 0 and array[i - 1] >= array[i]):
		i -= 1
		
	if (i <= 0):
		return []
	
	# Find successor to pivot
	j = len(array) - 1
	
	while (array[j] <= array[i-1]):
		j -= 1
	
	temp = array[i - 1]
	array[i - 1] = array[j]
	array[j] = temp

	# Reverse suffix
	j = len(array) - 1
	
	while (i < j):
		temp = array[i]
		array[i] = array[j]
		array[j] = temp
		i += 1
		j -= 1
	
	return array

# Determine if one number is a permutation of another
def IsPermutation (start, target):
	permutation = False
	
	# Convert the integer to a string
	startString = str(start)
	startString = ''.join(sorted(startString))
	
	targetString = str(target)
	targetString = ''.join(sorted(targetString))
	
	if (startString == targetString):
		permutation = True
	
	return permutation


primes = GetPrimes (MAXIMUM_VALUE)

# Loop over the list of primes, determining if they are a 
# candidate for the sequence based on given constraints
for i in range(0, len(primes)):
	# Continue if less than our minimum or already known
	if (primes[i] < MINIMUM_VALUE) or (primes[i] == GIVEN_VALUE):
		continue
		
	for j in range(i+1, len(primes)):
		difference = primes[j] - primes[i]
		thirdNumber = primes[j] + difference
		
		# Continue if above the maximum or not prime
		if (thirdNumber > MAXIMUM_VALUE) or (not IsPrime (thirdNumber)):
			continue
		
		# Determine if they are all permutations of each other
		if (IsPermutation(primes[i], primes[j]) and IsPermutation(primes[i], thirdNumber)):
			print ("The sequence is: ", primes[i], primes[j], thirdNumber)
