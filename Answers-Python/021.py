#!/usr/bin/python

# Project Euler Problem 21
#
# Let d(n) be defined as the sum of proper divisors of n 
# (numbers less than n which divide evenly into n).
#
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable 
# pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; 
# therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# 
# Evaluate the sum of all the amicable numbers under 10000.
#
# Answer: 31626
	
UPPER_LIMIT = 10000

# Brute force amicable number finder
def FindAmicableNumbers (limit):
	# We will use a vector of bools to track which numbers are amicable
	# This makes it much more straightforward to mark both numbers in the pair
	# Also, add one to the limit so our indices equal the actual number
	numberTracker = [False for x in range(limit+1)]
	
	for i in range(2, UPPER_LIMIT+1):
		firstDivisorSum = 0
		
		# Find the sum of the proper divisors
		for j in range(1,i):
			if (0 == (i%j)):
				firstDivisorSum += j
		
		secondDivisorSum = 0
		
		# Find the sum of the proper divisors for
		# the result of our previous loop
		for k in range(1, firstDivisorSum):
			if (0 == (firstDivisorSum % k)):
				secondDivisorSum += k
		
		# Determine if amicable and track
		if ((secondDivisorSum == i) and (i != firstDivisorSum)):
			numberTracker[i] = True
			numberTracker[firstDivisorSum] = True
			
			print ("Amicable pair: * ", i, " * ", firstDivisorSum, " * ")	
			
	return numberTracker

amicableNumbers = FindAmicableNumbers(UPPER_LIMIT)
amicableSum = 0

# Find the sum of the amicable numbers
for i in range(1, UPPER_LIMIT+1):
	if (amicableNumbers[i]):
		amicableSum += i

print ("The sum is: ", amicableSum)