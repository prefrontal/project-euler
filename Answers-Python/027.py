#!/usr/bin/python

# Project Euler Problem 27
#
# Euler discovered the remarkable quadratic formula:
#
# n^2 + n + 41
# 
# It turns out that the formula will produce 40 primes for the consecutive 
# values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is 
# divisible by 41, and certainly when n = 41, 41^2 + 41 + 41 is clearly divisible by 41.
# 
# The incredible formula  n^2 - 79n + 1601 was discovered, which produces 80 primes for the
# consecutive values n = 0 to 79. The product of the coefficients, -79 and 1601, is -126479.
# 
# Considering quadratics of the form:
#
# n^2 + an + b, where |a| < 1000 and |b| < 1000
#
# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |-4| = 4
# Find the product of the coefficients, a and b, for the quadratic expression that produces 
# the maximum number of primes for consecutive values of n, starting with n = 0.
#
# Answer: -59231

# This answer isn't terribly fast since it completes in five seconds
# Some additional math would likely optimize the routine, but
# the brute force approach works OK for now...

def is_prime(test_value):
    # There are no primes less than 2
    if test_value < 2:
        return False

    prime_state = True

    for i in range(2, test_value):
        if (test_value % i) == 0:
            prime_state = False

    return prime_state


max_a = 0
max_b = 0
max_prime_count = 0

for a in range(-1000, 1000 + 1):
    for b in range(-1000, 1000 + 1):
        has_consecutive_primes = True
        prime_count = 0
        n = 0

        while has_consecutive_primes:
            next_value = n * n + a * n + b

            has_consecutive_primes = is_prime(next_value)

            if has_consecutive_primes:
                prime_count += 1

            n += 1

        if prime_count > max_prime_count:
            max_prime_count = prime_count
            max_a = a
            max_b = b

print ("Greatest number of consecutive primes: ", max_prime_count)
print ("The product of the coefficients was: ", (max_a * max_b))
