#!/usr/bin/python

# Project Euler Problem 9
#
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
#
# Answer: 31875000

TARGET_SUM = 1000;

pySum = 0
a = 0
b = 0
c = 0

for i in range (TARGET_SUM, 0, -1):
	for j in range ((TARGET_SUM-i), 0, -1):
		for k in range ((TARGET_SUM-i-j), 0, -1):
			if ((i+j+k) != TARGET_SUM):
				continue
			
			if ((i*i + j*j) != k*k):
				continue
				
			pySum = i*j*k

print "The product is: %d" % pySum