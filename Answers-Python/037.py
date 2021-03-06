#!/usr/bin/python

# Project Euler Problem 37
#
# The number 3797 has an interesting property. Being prime itself, 
# it is possible to continuously remove digits from left to right, 
# and remain prime at each stage: 3797, 797, 97, and 7. Similarly 
# we can work from right to left: 3797, 379, 37, and 3.
#
# Find the sum of the only eleven primes that are both 
# truncatable from left to right and right to left.
#
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
#
# Answer: 748317

import math

MAXIMUM_VALUE = 1000000
LOWER_PRIME_LIMIT = 7


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

    # Block out the low values
    prime_tracker[0] = False
    prime_tracker[1] = False

    for i in range(2, int(sqrt_maximum)):
        if not prime_tracker[i]:
            continue

        for j in range(i + i, maximum, i):
            prime_tracker[j] = False

    return prime_tracker


# Determine if a number is a truncateable prime number
# Pass in a vector of boolean values representing prime numbers
# This dramatically speeds things up instead of recalculating
def is_truncatable_prime(value, primes):
    if value <= LOWER_PRIME_LIMIT:
        return False

    # Truncate the number from right
    # Just start chopping off digits using a modulo
    # operation until there is nothing left
    right = value

    while right > 0:
        if not primes[right]:
            return False

        right = int(right / 10)

    # Truncate the number from left
    # Instead of determining length, just start with modulo the
    # maximum possible value and begin working down from there
    left = value
    j = MAXIMUM_VALUE

    while j >= 10:
        left %= j

        if not primes[left]:
            return False

        j = int(j / 10)

    return True


primes = get_primes(MAXIMUM_VALUE)
final_sum = 0

for i in range(LOWER_PRIME_LIMIT, len(primes)):
    if not primes[i]:
        continue

    if is_truncatable_prime(i, primes):
        final_sum += i

print ("The final sum is: ", final_sum)
