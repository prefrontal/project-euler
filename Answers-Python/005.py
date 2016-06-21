#!/usr/bin/python

# Project Euler Problem 5
#
# 2520 is the smallest number that can be divided by each of the numbers
# from 1 to 10 without any remainder. What is the smallest positive number 
# that is evenly divisible by all of the numbers from 1 to 20?
#
# Answer: 232792560

MAX_DIVISOR = 20


# Checks to see if a number is evenly divisible by all numbers between
# zero and a specified maximum divisor.

def is_evenly_divisible(value):
    if value < MAX_DIVISOR:
        return False

    evenly_divisible = True

    for i in range(MAX_DIVISOR, 0, -1):
        if 0 != (value % i):
            evenly_divisible = False
            break

    return evenly_divisible


# Finds the smallest number that is evenly divisible

current_value = MAX_DIVISOR

while True:
    current_value += 1

    if is_evenly_divisible(current_value):
        break

print "Smallest positive evenly divisible number: %d" % current_value
