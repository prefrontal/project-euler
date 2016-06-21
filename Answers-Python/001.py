#!/usr/bin/python

# Project Euler, Problem 001
#
# If we list all the natural numbers below 10 that are multiples of 3 or 5, 
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.
#
# Answer: 233168

lower_limit = 0
upper_limit = 1000

final_sum = 0

for i in range (lower_limit, upper_limit):
    if (i % 3 == 0) or (i % 5 == 0):
        final_sum += i
        
print "The final sum is: %s" % final_sum