#!/usr/bin/python

# Project Euler Problem 34
#
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# 
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
# 
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.
#
# Answer: 40730

import math

MAXIMUM_VALUE = 100000

# Brute force search between 10 and a predefined maximum value
final_sum = 0

for i in range(10, MAXIMUM_VALUE):
    temp = i
    factorial_sum = 0

    while temp > 0:
        factorial_sum += math.factorial(temp % 10)
        temp = int(temp / 10)

    if i == factorial_sum:
        final_sum += i

print ("The final sum is: ", final_sum)
