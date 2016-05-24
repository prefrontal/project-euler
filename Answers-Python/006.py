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
# Answer: 25164150

MAX_EVALUATION_NUMBER = 100

#
# Determines the difference between sum-of-suqares and 
# square-of-sums for a range of numbers
#

tempSum = 0
tempSumSquares = 0

for i in range (MAX_EVALUATION_NUMBER+1):
    tempSum += i
    tempSumSquares += i*i

sumOfSquares = tempSumSquares
squareOfSums = tempSum * tempSum
difference = abs(sumOfSquares - squareOfSums)

print "The difference is: %d" % difference