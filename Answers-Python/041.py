#!/usr/bin/python

# Project Euler Problem 41
#
# We shall say that an n-digit number is pandigital if it makes 
# use of all the digits 1 to n exactly once. For example, 2143 
# is a 4-digit pandigital and is also prime.
#
# What is the largest n-digit pandigital prime that exists?
#
# Answer: 7652413

import math

MAXIMUM_VALUE = 987654321


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


# Determine if an integer is a pandigital number
def is_pandigital_number(n, input):
    # Convert the integer to a string and sort
    temp = str(input)
    temp = ''.join(sorted(temp))

    # Create a sorted pandigital string that
    # has the same length as the input
    target = ""
    for i in range(1, n + 1):
        target += str(i)

    # Determine pandigitality
    if temp == target:
        return True
    else:
        return False


# Return the number of characters in an integer
def get_integer_length(integer_input):
    integer_length = 0
    temp = integer_input

    while temp > 0:
        temp /= 10
        integer_length += 1

    return integer_length


# Determine the largest pandigital prime
# This isn't the most optimal solution since it takes about three
# minutes to get the final answer. I am sure it could be optimized.

max_pandigital = 0

primes = get_primes(MAXIMUM_VALUE)

print ("Number of primes: ", len(primes))

for it in primes:
    length = get_integer_length(it)
    is_pandigital = is_pandigital_number(length, it)

    if is_pandigital and (it > max_pandigital):
        max_pandigital = it

print ("The maximum pandigital is: ", max_pandigital)
