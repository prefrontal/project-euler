#!/usr/bin/python

# Project Euler Problem 47
#
# The first two consecutive numbers to have two distinct prime factors are:
# 
# 14 = 2 x 7
# 15 = 3 x 5
# 
# The first three consecutive numbers to have three distinct prime factors are:
# 
# 644 = 2^2 x 7 x 23
# 645 = 3 x 5 x 43
# 646 = 2 x 17 x 19.
# 
# Find the first four consecutive integers to have four distinct prime factors. 
# What is the first of these numbers?
#
# Answer: 134043

import math

TARGET_FACTOR_COUNT = 4
TARGET_RUN_LENGTH = 4
MAXIMUM_VALUE = 150000


# Sieve of Eratosthenes
# Simple, ancient algorithm for finding all prime numbers up to any given limit.
# It does so by iteratively marking as composite (i.e., not prime) the multiples
# of each prime, starting with the multiples of 2.
def get_primes(maximum):
    # There are no primes less than 2
    if maximum < 2:
        return

    # Construct and execute the Sieve
    sqrt_maximum = math.sqrt(maximum)
    primes = []
    prime_tracker = []

    for i in range(maximum):
        prime_tracker.append(True)

    for i in range(2, int(sqrt_maximum)):
        if not prime_tracker[i]:
            continue

        for j in range(i + i, maximum, i):
            prime_tracker[j] = False

    # Generate the list of primes to return
    for k in range(2, maximum):
        if prime_tracker[k]:
            primes.append(k)

    return primes


# Get a list of the prime factors of a given integer
# This function expects to have a valid list of primes passed in
def get_prime_factors(number, primes):
    factor_count = 0
    last_factor = 0
    remainder = number

    # Keep looping until we reach the end of our dividing
    while remainder != 1:
        # Determine the lowest prime that we can use to divide the remainder
        for i in range(0, len(primes)):
            if remainder <= 1:  # Sanity check
                break

            # Found a prime factor
            if 0 == remainder % primes[i]:
                # If the current factor is the same as
                # the last one then don't count it
                if primes[i] != last_factor:
                    factor_count += 1
                    last_factor = primes[i]

                remainder /= primes[i]
                break

    return factor_count


# We are using brute force for the prime factor search
# This takes about sixteen seconds on my machine
# There are clearly some ways that we could speed this up

primes = get_primes(MAXIMUM_VALUE)

lead_value = 0
consecutive_prime_count = 0

# Examine all integers up to the maximum value
# Start at one so we don't try to factor zero
for i in range(1, MAXIMUM_VALUE):
    factor_count = get_prime_factors(i, primes)

    # Reset the counter if we didn't get the right number of factors
    if factor_count != TARGET_FACTOR_COUNT:
        consecutive_prime_count = 0
        continue

    # If this is the first in a new potential sequence
    # then keep track of the lead integer value
    if consecutive_prime_count == 0:
        lead_value = i

    consecutive_prime_count += 1

    # Determine if we have found the target run
    if consecutive_prime_count == TARGET_RUN_LENGTH:
        break

print ("The target integer is: ", lead_value)
