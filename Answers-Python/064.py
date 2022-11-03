#!/usr/bin/python

# Project Euler Problem 62
#
# (See online page for the question, since it contains equation images)
# https://projecteuler.net/problem=64
#
# Exactly four continued fractions, for N <= 13, have an odd period.
# How many continued fractions for N <= 10000 have an odd period?
#
# Answer: 1322

import math

result = 0

for n in range(2, 10000):
	limit = math.floor(math.sqrt(n))

	# Ignore perfect squares
	if limit * limit == n:
		continue
	
	# Had to look up the algorithm, since the instructions weren't great
	# https://en.wikipedia.org/wiki/Continued_fraction
	# https://en.wikipedia.org/wiki/Methods_of_computing_square_roots
	# https://www.mathblog.dk/project-euler-continued-fractions-odd-period/
	
	period = 0
	d = 1
	m = 0
	a = limit
	
	while True:
		m = math.floor(d * a - m)
		d = math.floor((n - m * m) / d)
		a = math.floor((limit + m) / d)
		period += 1
		
		# This is the secret sauce to knowing when the period ends
		if a == 2 * limit:
			break
	
	# Check if the period is odd
	if period % 2 == 1:
		result += 1

print("The number of squareroots with an odd period is: ", result)