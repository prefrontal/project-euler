#!/usr/bin/python

# Project Euler Problem 27
#
# Euler discovered the remarkable quadratic formula:
#
# n² + n + 41
# 
# It turns out that the formula will produce 40 primes for the consecutive 
# values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is 
# divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.
# 
# The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes for the 
# consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.
# 
# Considering quadratics of the form:
#
# n² + an + b, where |a| < 1000 and |b| < 1000
#
# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |−4| = 4
# Find the product of the coefficients, a and b, for the quadratic expression that produces 
# the maximum number of primes for consecutive values of n, starting with n = 0.
#
# Answer: -59231

# This answer isn't terribly fast since it completes in five seconds
# Some additional math would likely optimize the routine, but
# the brute force approach works OK for now...

def IsPrime (testValue):
	# There are no primes less than 2
	if (testValue < 2):
		return False
	
	primeState = True
	
	for i in range(2,testValue):
		if ((testValue % i) == 0):
			primeState = False
	
	return primeState

maxA = 0
maxB = 0
maxPrimeCount = 0

for a in range(-1000,1000+1):
	for b in range(-1000,1000+1):
		hasConsecutivePrimes = True
		primeCount = 0
		n = 0
		
		while (hasConsecutivePrimes):
			nextValue = n*n + a*n + b

			hasConsecutivePrimes = IsPrime(nextValue)
			
			if (hasConsecutivePrimes):
				primeCount += 1
				
			n += 1
		
		if (primeCount > maxPrimeCount):
			maxPrimeCount = primeCount
			maxA = a
			maxB = b

print ("Greatest number of consecutive primes: ", maxPrimeCount)
print ("The product of the coefficients was: ", (maxA * maxB))