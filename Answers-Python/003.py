#!/usr/bin/python

# Project Euler, Problem 003
#
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?
# Answer: 6857

import math

TARGET_NUMBER = 600851475143


def is_prime(test_value):
    if test_value < 2:
        return False

    prime_state = True

    for i in range(2, test_value):
        if (test_value % i) == 0:
            prime_state = False
            break

    return prime_state


def determine_largest_prime_factor(inputValue):
    largest_factor = 0
    sqrt_input = math.sqrt(inputValue)

    for i in range(3, int(sqrt_input), 2):
        if (inputValue % i) == 0:
            if is_prime(i):
                if i > largest_factor:
                    largest_factor = i

    return largest_factor


factor = determine_largest_prime_factor(TARGET_NUMBER)
print "Largest prime factor: %d" % factor
