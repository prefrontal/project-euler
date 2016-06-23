#!/usr/bin/python

# Project Euler Problem 36
#
# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
#
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# 
# (Please note that the palindromic number, in either base, may not include leading zeros.)
#
# Answer: 872187

import sys

MAXIMUM_VALUE = 1000000


# Determines if an integer is a decimal palindrome through string comparison
def is_decimal_palindrome(value):
    # Convert the integer to a string
    # Reverse the string and compare to the original
    forward = str(value)
    reverse = forward[::-1]

    if forward == reverse:
        return True

    return False


# Determines if a 32-bit integer is a binary palindrome through string comparison
def is_binary_palindrome(input):
    forward = ""

    # Start at highest-order bit of int
    position = (sys.getsizeof(0) * 8) - 1

    # Determine the position of the first non-zero character
    while position >= 0:
        position_value = (input & (1 << position)) >> position

        if (position_value == 1):
            break

        position -= 1

    # Now load the stringstream with the remaining digits
    while position >= 0:
        position_value = (input & (1 << position)) >> position
        forward += str(position_value)
        position -= 1

    reverse = forward[::-1]

    if forward == reverse:
        return True

    return False


final_sum = 0

for i in range(0, MAXIMUM_VALUE):
    if is_decimal_palindrome(i) and is_binary_palindrome(i):
        final_sum += i

print ("The final sum is: ", final_sum)
