#!/usr/bin/python

# Project Euler Problem 50
#
# The prime 41, can be written as the sum of six consecutive primes:
#
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# 
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
# 
# The longest sum of consecutive primes below one-thousand that 
# adds to a prime, contains 21 terms, and is equal to 953.
# 
# Which prime, below one-million, can be written as the sum of the most consecutive primes?
# 
# Answer: 997651

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
	
	# Generate the list of primes to return
	for k in range (2, maximum):
		if (primeTracker[k] == True):
			primes.append(k)
			
	return primes

# This answer is computationally inefficient. Since we work backward over the primes
# array we actually find the answer within a few seconds. However, it takes a significant
# amount of time to go through the entire primes array to know the definitive answer.
# This could/should be reworked with a another strategy that is more optimal.

primes = GetPrimes(MAXIMUM_VALUE)

# For loop efficieny, cache the size
numPrimes = len(primes)

maxPrimeCount = 0
maxPrime = 0

# Loop over all primes in the vector in reverse since we assume
# our target is a value closer to the top value than the bottom
for i in range(numPrimes-1, 0-1, -1):
	# This loop defines the starting point for 
	# calculating the consecutive sums
	for j in range(0, numPrimes):
		primeCount = 0
		primeSum = 0
		
		# Calculate the consecutive prime sum
		while (primeSum < primes[i]):
			if (j+primeCount >= numPrimes):
				break
				
			primeSum += primes[j+primeCount]
			primeCount += 1
			
	    # Count it if we hit the prime exactly and have the highest count
		if ((primeSum == primes[i]) and (primeCount > maxPrimeCount)):
			maxPrime = primes[i];
			maxPrimeCount = primeCount;

print ("The target prime is: ", maxPrime)