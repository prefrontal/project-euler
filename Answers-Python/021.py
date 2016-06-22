#!/usr/bin/python

# Project Euler Problem 21
#
# Let d(n) be defined as the sum of proper divisors of n 
# (numbers less than n which divide evenly into n).
#
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable 
# pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; 
# therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# 
# Evaluate the sum of all the amicable numbers under 10000.
#
# Answer: 31626

UPPER_LIMIT = 10000


# Brute force amicable number finder
def find_amicable_numbers(limit):
    # We will use a vector of bools to track which numbers are amicable
    # This makes it much more straightforward to mark both numbers in the pair
    # Also, add one to the limit so our indices equal the actual number
    number_tracker = [False for x in range(limit + 1)]

    for i in range(2, UPPER_LIMIT + 1):
        first_divisor_sum = 0

        # Find the sum of the proper divisors
        for j in range(1, i):
            if 0 == (i % j):
                first_divisor_sum += j

        second_divisor_sum = 0

        # Find the sum of the proper divisors for
        # the result of our previous loop
        for k in range(1, first_divisor_sum):
            if 0 == (first_divisor_sum % k):
                second_divisor_sum += k

        # Determine if amicable and track
        if (second_divisor_sum == i) and (i != first_divisor_sum):
            number_tracker[i] = True
            number_tracker[first_divisor_sum] = True

            print ("Amicable pair: * ", i, " * ", first_divisor_sum, " * ")

    return number_tracker


amicable_numbers = find_amicable_numbers(UPPER_LIMIT)
amicable_sum = 0

# Find the sum of the amicable numbers
for i in range(1, UPPER_LIMIT + 1):
    if amicable_numbers[i]:
        amicable_sum += i

print ("The sum is: ", amicable_sum)
