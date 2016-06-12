#!/usr/bin/python

# Project Euler Problem 26
#
# A unit fraction contains 1 in the numerator. The decimal representation of the 
# unit fractions with denominators 2 to 10 are given:
# 
# 1/2	= 	0.5
# 1/3	= 	0.(3)
# 1/4	= 	0.25
# 1/5	= 	0.2
# 1/6	= 	0.1(6)
# 1/7	= 	0.(142857)
# 1/8	= 	0.125
# 1/9	= 	0.(1)
# 1/10	= 	0.1
#
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. 
# It can be seen that 1/7 has a 6-digit recurring cycle.
#
# Find the value of d < 1000 for which 1/d contains the longest 
# recurring cycle in its decimal fraction part.
#
# Answer: 983

import math

MAXIMUM_VALUE = 1000

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

# Calculate pow(a,b) mod n
# For this problem std::pow(a,b)%n will overflow
# This template function calculates iteratively, avoiding the overflow
# From: http:#stackoverflow.com/questions/8496182/calculating-powa-b-mod-n
def modpow (base, exp, modulus):
	base %= modulus
	result = 1
	
	while (exp > 0):
		if (exp & 1):
			result = (result * base) % modulus
		base = (base * base) % modulus
		exp >>= 1
	
	return result

# Determine the cycle length of the fraction
# By solving the discrete logarithm
def DetermineCycleLength (value):
	for i in range(1,value+1):
		a = modpow (10, i, value)
		
		if (a == 1):
			return i
	
	return 0

# We only need to look at prime values
primes = GetPrimes (MAXIMUM_VALUE)

longestCycle = 0
longestDenominator = 0

for it in primes:
	cycleLength = DetermineCycleLength (it);

	if (cycleLength > longestCycle):
		longestCycle = cycleLength
		longestDenominator = it

print ("The denominator with the longest cycle is: ", longestDenominator, " with length: ", longestCycle)
	