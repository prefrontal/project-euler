#!/usr/bin/python

# Project Euler Problem 50
#
# The prime 41, can be written as the sum of six consecutive primes:
#
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# 
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
# 
# The longest sum of consecutive primes below one-thousand that 
# adds to a prime, contains 21 terms, and is equal to 953.
# 
# Which prime, below one-million, can be written as the sum of the most consecutive primes?
# 
# Answer: 997651

import math

MAXIMUM_VALUE = 1000000


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


# This answer is computationally inefficient. Since we work backward over the primes
# array we actually find the answer within a few seconds. However, it takes a significant
# amount of time to go through the entire primes array to know the definitive answer.
# This could/should be reworked with a another strategy that is more optimal.

primes = get_primes(MAXIMUM_VALUE)

# For loop efficieny, cache the size
num_primes = len(primes)

max_prime_count = 0
max_prime = 0

# Loop over all primes in the vector in reverse since we assume
# our target is a value closer to the top value than the bottom
for i in range(num_primes - 1, 0 - 1, -1):
    # This loop defines the starting point for
    # calculating the consecutive sums
    for j in range(0, num_primes):
        prime_count = 0
        prime_sum = 0

        # Calculate the consecutive prime sum
        while prime_sum < primes[i]:
            if j + prime_count >= num_primes:
                break

            prime_sum += primes[j + prime_count]
            prime_count += 1

            # Count it if we hit the prime exactly and have the highest count
        if (prime_sum == primes[i]) and (prime_count > max_prime_count):
            max_prime = primes[i]
            max_prime_count = prime_count

print ("The target prime is: ", max_prime)
