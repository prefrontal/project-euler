#!/usr/bin/python

# Project Euler Problem 16
#
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2^1000?
#
# Answer: 1366

import math

EXPONENT = 1000
ASCII_OFFSET = 48

# Calculate the sum of digits in any power of 2 up to 2^1023

# A double can hold from 2^0 to 2^1023 exactly
# http://www.exploringbinary.com/what-powers-of-two-look-like-inside-a-computer/
# http://www.exploringbinary.com/a-simple-c-program-that-prints-2098-powers-of-two/

number = math.pow(2, EXPONENT)
number_string = "%d" % number
sum = 0

for i in range(0, len(number_string)):
    sum += int(number_string[i])

print "The sum of digits is: %d" % sum
