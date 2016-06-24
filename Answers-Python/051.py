#!/usr/bin/python

# Project Euler Problem 51
#
# By replacing the 1st digit of the 2-digit number *3, it turns out that six 
# of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
#
# By replacing the 3rd and 4th digits of 56**3 with the same digit, this 
# 5-digit number is the first example having seven primes among the ten
# generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 
# 56773, and 56993. Consequently 56003, being the first member of this family, 
# is the smallest prime with this property.
# 
# Find the smallest prime which, by replacing part of the number (not necessarily 
# adjacent digits) with the same digit, is part of an eight prime value family.
#
# Answer: 121313

import math

MAXIMUM_VALUE = 1000000
TARGET_PRIME_COUNT = 8


# --PRIME HELPERS----------------------------------------------------------------

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
# Brute-force check to determine if a number is prime
# Used to validate the Sieve results.  Could also be
# used when the Sieve would use too much memory.
#
def is_prime(input):
    if input < 2:
        return False

    prime_state = True

    for i in range(2, input):
        if (input % i) == 0:
            prime_state = False
            break

    return prime_state


# --VECTOR HELPERS--------------------------------------------------------------

# Take an integer and create a vector of the digits
def int_to_vector(input):
    return list(map(int, str(input)))


# Take a vector of single integers and generate a whole integer value
def vector_to_int(input):
    s = ''.join(map(str, input))
    return int(s)


# --MAIN METHODS--------------------------------------------------------------

# This is a tough one. I admit I had to look it up to get some help.
#
# From: http:#www.mathblog.dk/project-euler-51-eight-prime-family/
# 1) The repeated digits have to be a 0, 1, or 2 to have an eight-member family
# 2) There must be three repeating digits
# 3) Last digit cannot be repeating
# 4) The lowest prime will have five or six digits

def is_eight_member_prime_family(input, index1, index2, index3):
    prime_count = 0
    temp = input

    # Swap positions with new value and evaluate primeness
    # The input is guaranteed to be prime, but we will iterate over it anyway
    for i in range(0, 10):
        temp[index1] = i
        temp[index2] = i
        temp[index3] = i

        # Continue if the number starts with zero
        if temp[0] == 0:
            continue

        new_value = vector_to_int(temp)

        if is_prime(new_value):
            prime_count += 1

    return TARGET_PRIME_COUNT == prime_count


def evaluate_number(input):
    # Setup pattern indices
    indices = [
        [2, 3, 4],
        [1, 3, 4],
        [1, 2, 4],
        [1, 2, 3],
        [0, 3, 4],
        [0, 2, 4],
        [0, 2, 3],
        [0, 1, 4],
        [0, 1, 3],
        [0, 1, 2]]

    found_answer = False

    # Iterate over all patters, evaluating if thery are candidates
    for i in range(0, 10):
        # Skip some permutations if there are only five digits
        if (len(input) == 5) and (indices[i][2] == 4):
            continue

        # Evaluate digit equivalency
        if input[indices[i][0]] != input[indices[i][1]]:
            continue
        elif input[indices[i][0]] != input[indices[i][2]]:
            continue
        elif input[indices[i][1]] != input[indices[i][2]]:
            continue

        # Evaluate if it is an eight member prime family
        found_answer += is_eight_member_prime_family(input, indices[i][0], indices[i][1], indices[i][2])

    return found_answer


primes = get_primes(MAXIMUM_VALUE)

final_answer = 0

for it in primes:
    found_solution = False
    digits = int_to_vector(it)

    # Searche five- and six-digit numbers for a solution
    if it < 10000:
        continue
    elif it < 1000000:
        found_solution = evaluate_number(digits)

    if found_solution:
        final_answer = it
        break

print ("The lowest prime in an eight member family is: ", final_answer)
