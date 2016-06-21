#!/usr/bin/python

# Project Euler Problem 6
#
# The sum of the squares of the first ten natural numbers is,
# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)^2 = 55^2 = 3025
# Hence the difference between the sum of the squares of the first 
# ten natural numbers and the square of the sum is 3025 - 385 = 2640.
# Find the difference between the sum of the squares of the first 
# one hundred natural numbers and the square of the sum.
#
# Answer: 25164150

MAX_EVALUATION_NUMBER = 100

#
# Determines the difference between sum-of-suqares and 
# square-of-sums for a range of numbers
#

temp_sum = 0
temp_sum_squares = 0

for i in range(MAX_EVALUATION_NUMBER + 1):
    temp_sum += i
    temp_sum_squares += i * i

sum_of_squares = temp_sum_squares
square_of_sums = temp_sum * temp_sum
difference = abs(sum_of_squares - square_of_sums)

print "The difference is: %d" % difference
