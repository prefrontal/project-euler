#!/usr/bin/python

# Project Euler Problem 20
#
# n! means n x (n − 1) x ... x 3 x 2 x 1
#
# For example, 10! = 10 x 9 x ... x 3 x 2 x 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!
#
# Answer: 648

FACTORIAL_NUMBER = 100
NUMBER_ARRAY_SIZE = 200

# So, 100! = 9.332622e+157. We will need to do something clever here.

# Use an integer array to hold the large number
# Init first element to one so we can multiply later
big_number = [0 for x in range(NUMBER_ARRAY_SIZE)]
big_number[0] = 1

for i in range(1, FACTORIAL_NUMBER + 1):
    carry_over = 0

    for j in range(NUMBER_ARRAY_SIZE):
        temp = (big_number[j] * i) + carry_over
        big_number[j] = temp % 10
        carry_over = int(temp / 10)

final_sum = 0

for t in range(NUMBER_ARRAY_SIZE):
    final_sum += big_number[t]

print ("The final sum is: ", final_sum)
