#!/usr/bin/python

# Project Euler Problem 4
#
# A palindromic number reads the same both ways. 
# The largest palindrome made from the product of two 
# 2-digit numbers is 9009 = 91 x 99. Find the largest 
# palindrome made from the product of two 3-digit numbers.
#
# Answer: 906609


#
# Determines if an integer is a palindrome through string comparison 
#
def is_palindrome(value):
    forward = str(value)
    reverse = forward[::-1]

    if forward == reverse:
        return True

    return False


#
# Determines if an integer is a palindrome through integer manipulation
#
def is_palindrome2(value):
    reversed_value = 0
    temp = value

    while temp != 0:
        reversed_value *= 10
        reversed_value += (temp % 10)
        temp /= 10

    if value == reversed_value:
        return True

    return False


max_palindrome = 0

for i in range(100, 1000):
    for j in range(100, 1000):
        if not is_palindrome(i * j):
            continue

        if (i * j) > max_palindrome:
            max_palindrome = i * j

print "The largest palindrome is: %d" % max_palindrome
