#!/usr/bin/python

# Project Euler 46
#
# It was proposed by Christian Goldbach that every odd composite 
# number can be written as the sum of a prime and twice a square.
# 
# 9 = 7 + 2×1^2
# 15 = 7 + 2×2^2
# 21 = 3 + 2×3^2
# 25 = 7 + 2×3^2
# 27 = 19 + 2×2^2
# 33 = 31 + 2×1^2
# 
# It turns out that the conjecture was false.
# 
# What is the smallest odd composite that cannot be written 
# as the sum of a prime and twice a square?
#
# Answer: 5777

import math

MAXIMUM_VALUE = 10000
STARTING_VALUE = 33

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
# Generate all primes up to a given maximum value
#
def GetSquares (maximum):
	squares = []
	index = 0
	
	while (index*index < maximum):
		squares.append(index*index)
		index += 1
	
	return squares
	
	
lowestComposite = 0

primes = GetPrimes(MAXIMUM_VALUE)
squares = GetSquares(MAXIMUM_VALUE)

# Main loop evaluating odd composite numbers
# To keep things simple, we will not exclude prime numbers,
# which will always have a solution anyway as prime + 0^2
for i in range(STARTING_VALUE, MAXIMUM_VALUE, 2):
	hasNoSolution = True
	
	# Loop iterating over primes
	for j in range(0,len(primes)):
		# Break the loop if we have exceeded the number
		if (j > i):
			break
		
		# Loop iterating over squares
		for k in range(0,len(squares)):
			# Break the loop if we have exceeded the number
			if (k > i):
				break
			
			if (i == primes[j] + 2*squares[k]):
				hasNoSolution = False
	
	# Have we found the target?
	if (hasNoSolution):
		lowestComposite = i
		break

print ("The lowest odd composite without a solution is: ", lowestComposite)