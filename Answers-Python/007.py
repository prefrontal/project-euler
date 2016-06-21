#!/usr/bin/python

# Project Euler Problem 7

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13
# we can see that the 6th prime is 13.
# What is the 10,001st prime number?
# Answer: 104743

TARGET_VALUE = 10001


# Brute-force check to determine if a number is prime
# Used to validate the Sieve results.  Could also be
# used when the Sieve would use too much memory.

def is_prime(test_value):
    # There are no primes less than 2
    if test_value < 2:
        return False

    prime_state = True

    for i in range(2, test_value):
        if (test_value % i) == 0:
            prime_state = False

    return prime_state


# Find specific primes according to their ordinal position
# Starting at thirteen means we can do some modulo checks for speed

current_value = 13
prime_counter = 6

while True:
    current_value += 2

    if (0 == (current_value % 3)) or (0 == (current_value % 5)) or (0 == (current_value % 7)) or (0 == (current_value % 11)):
        continue

    if is_prime(current_value):
        prime_counter += 1

    if TARGET_VALUE == prime_counter:
        break

print "The %d prime is: %d" % (TARGET_VALUE, current_value)
