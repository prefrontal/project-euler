#!/usr/bin/python

# Project Euler Problem 33
#
# The fraction 49/98 is a curious fraction, as an inexperienced mathematician 
# in attempting to simplify it may incorrectly believe that 49/98 = 4/8, 
# which is correct, is obtained by cancelling the 9s.
# 
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
# 
# There are exactly four non-trivial examples of this type of fraction, 
# less than one in value, and containing two digits in the numerator and denominator.
# 
# If the product of these four fractions is given in its lowest common 
# terms, find the value of the denominator.
#
# Answer: 100


def compute_second_quotient(numerator, denominator):
    # Don't divide by zero
    if denominator == 0:
        return 0.0

    # The quotient should be less than one
    if numerator >= denominator:
        return 0.0

    return float(numerator) / float(denominator)


# Find the greatest common divisor of two numbers based on Stein's Algorithm
# From: https://en.wikipedia.org/wiki/Binary_GCD_algorithm
def greatest_common_divisor(u, v):
    shift = 0

    # GCD(0,v) == v; GCD(u,0) == u, GCD(0,0) == 0
    if u == 0:
        return v

    if v == 0:
        return u

    # Let shift := lg K, where K is the greatest
    # power of 2 dividing both u and v
    while True:
        u >>= 1
        v >>= 1

        shift += 1

        if ((u | v) & 1) != 0:
            break

    while (u & 1) == 0:
        u >>= 1

    # From here on, u is always odd
    while True:
        # Remove all factors of 2 in v -- they are not common
        # Note: v is not zero, so while will terminate
        while (v & 1) == 0:  # Loop X
            v >>= 1

        # Now u and v are both odd. Swap if necessary so u <= v,
        # then set v = v - u (which is even). For bignums, the
        # swapping is just pointer movement, and the subtraction
        # can be done in-place
        if u > v:
            # Swap u and v.
            t = v
            v = u
            u = t

        # Here v >= u.
        v = v - u

        if v == 0:
            break

    # Restore common factors of 2
    return u << shift


final_numerator = 1
final_denominator = 1

# The numerator and the denominator will both have two digits
# The quotient will always be less than one, so we can shorten the inner loop
for i in range(10, 100):
    for j in range(i, 100):
        quotient = float(i) / float(j)

        ib = i % 10
        ia = int((i / 10) % 10)

        jb = j % 10
        ja = int((j / 10) % 10)

        found_match = False
        second_quotient = 0.0

        if ia == ja:
            found_match = True
            second_quotient = compute_second_quotient(ib, jb)

        if ib == jb:
            found_match = True
            second_quotient = compute_second_quotient(ia, ja)

        if ia == jb:
            found_match = True
            second_quotient = compute_second_quotient(ib, ja)

        if ib == ja:
            found_match = True
            second_quotient = compute_second_quotient(ia, jb)

        # Continue to next iteration if we didn't find a match
        if not found_match:
            continue

        # Eliminate trivial cases
        if ib == 0 and jb == 0:
            continue

        if quotient == second_quotient:
            final_numerator *= i
            final_denominator *= j

print (final_numerator, "/", final_denominator)
answer = final_denominator / greatest_common_divisor(final_numerator, final_denominator)
print ("Final answer: ", answer)
