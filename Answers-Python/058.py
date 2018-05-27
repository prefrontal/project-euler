#!/usr/bin/python

# Project Euler Problem 58
#
# Starting with 1 and spiralling anticlockwise in the following way, a square spiral with side length 7 is formed.
#
#     37 36 35 34 33 32 31
#     38 17 16 15 14 13 30
#     39 18  5  4  3 12 29
#     40 19  6  1  2 11 28
#     41 20  7  8  9 10 27
#     42 21 22 23 24 25 26
#     43 44 45 46 47 48 49
#
# It is interesting to note that the odd squares lie along the bottom right diagonal, but what is more interesting
# is that 8 out of the 13 numbers lying along both diagonals are prime; that is, a ratio of 8/13 = 62%.
#
# If one complete new layer is wrapped around the spiral above, a square spiral with side length 9 will be formed.
# If this process is continued, what is the side length of the square spiral for which the ratio of
# primes along both diagonals first falls below 10%?
#
# Answer: 26241
# This is totally brute force, takes 12 seconds on a Macbook...

# Upper limit must always be odd here
UPPER_LIMIT = 1000001
TARGET_RATIO = 0.10


def is_prime(test_value):
    if test_value < 2:
        return False

    prime_state = True

    for j in range(2, int(test_value**0.5)):
        if (test_value % j) == 0:
            prime_state = False
            break

    return prime_state


# Initial values count the center '1' value already
total_count = 1
prime_count = 0

for i in range(3, UPPER_LIMIT, 2):

    # Bottom right diagonal number for this iteration
    # Since it is a square, it is never prime
    base_number = i**2
    total_count += 1

    # Now calculate the other three corners
    for j in range(1, 4):
        corner_value = base_number - j * i + j
        total_count += 1
        if is_prime(corner_value):
            prime_count += 1

    if (prime_count / total_count) < TARGET_RATIO:
        print("Fell below target ratio with side length: ", i)
        exit()

