#!/usr/bin/python

# Project Euler 46
#
# It was proposed by Christian Goldbach that every odd composite 
# number can be written as the sum of a prime and twice a square.
# 
# 9 = 7 + 2x1^2
# 15 = 7 + 2x2^2
# 21 = 3 + 2x3^2
# 25 = 7 + 2x3^2
# 27 = 19 + 2x2^2
# 33 = 31 + 2x1^2
# 
# It turns out that the conjecture was false.
# 
# What is the smallest odd composite that cannot be written 
# as the sum of a prime and twice a square?
#
# Answer: 5777

import math

MAXIMUM_VALUE = 10000
STARTING_VALUE = 33


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


# Generate all primes up to a given maximum value
def get_squares(maximum):
    squares = []
    index = 0

    while index * index < maximum:
        squares.append(index * index)
        index += 1

    return squares


lowest_composite = 0

primes = get_primes(MAXIMUM_VALUE)
squares = get_squares(MAXIMUM_VALUE)

# Main loop evaluating odd composite numbers
# To keep things simple, we will not exclude prime numbers,
# which will always have a solution anyway as prime + 0^2
for i in range(STARTING_VALUE, MAXIMUM_VALUE, 2):
    has_no_solution = True

    # Loop iterating over primes
    for j in range(0, len(primes)):
        # Break the loop if we have exceeded the number
        if j > i:
            break

        # Loop iterating over squares
        for k in range(0, len(squares)):
            # Break the loop if we have exceeded the number
            if k > i:
                break

            if i == primes[j] + 2 * squares[k]:
                has_no_solution = False

    # Have we found the target?
    if has_no_solution:
        lowest_composite = i
        break

print ("The lowest odd composite without a solution is: ", lowest_composite)
