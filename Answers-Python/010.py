#!/usr/bin/python

# Project Euler Problem 10
#
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.
# Answer: 142913828922

import math

TARGET_NUMBER = 2000000


#
# Sieve of Eratosthenes
# Simple, ancient algorithm for finding all prime numbers up to any given limit.
# It does so by iteratively marking as composite (i.e., not prime) the multiples
# of each prime, starting with the multiples of 2.
#
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


#
# Find the sume of all primes up to a given number
#
my_primes = get_primes(TARGET_NUMBER)
prime_sum = 0

for it in my_primes:
    prime_sum += it

print "The sum is: %d" % prime_sum
