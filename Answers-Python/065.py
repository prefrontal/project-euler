#!/usr/bin/python

# Project Euler Problem 65
#
# (See online page for the question, since it contains equation images)
# https://projecteuler.net/problem=65
#
# Find the sum of digits in the numerator of the 100th convergent
# of the continued coeffs for e.
#
# Answer: 272

import math

# Create a list with the first 100 elements of continued fraction coefficients
# Start with the first two terms set to simplify repeating
coeffs = []
coeffs.append(2)
coeffs.append(1)

# Every third value should +2 the value from three elements ago
k = 0
for i in range(3, 101):
	if i % 3 == 0:
		k += 2
		coeffs.append(k)
		continue
	coeffs.append(1)

# Work backward from the 100th iteration in the continued fraction
numerator = 0
denominator = 1
	
for j in range(99,0,-1):
	a = coeffs[j] * denominator + numerator
	b = denominator
	
	numerator = b
	denominator = a

numerator = numerator + denominator * coeffs[0]

print("Approximation: ", numerator / denominator)
print("Actual e:      ", math.e)

digits = [int(x) for x in str(numerator)]
print("Sum of digits in numerator: ", sum(digits))	
