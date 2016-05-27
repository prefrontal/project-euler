#!/usr/bin/python

# Project Euler Problem 10
#
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.
# Answer: 142913828922

import math

TARGET_NUMBER = 2000000;

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
# Find the sume of all primes up to a given number
#
myPrimes = GetPrimes(TARGET_NUMBER)
primeSum = 0

for it in myPrimes:
	primeSum += it
	
print "The sum is: %d" % primeSum