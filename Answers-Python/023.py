#!/usr/bin/python

# Project Euler Problem 23
#
# A perfect number is a number for which the sum of its proper divisors is 
# exactly equal to the number. For example, the sum of the proper divisors of
# 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less 
# than n and it is called abundant if this sum exceeds n.
# 
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest 
# number that can be written as the sum of two abundant numbers is 24. By mathematical 
# analysis, it can be shown that all integers greater than 28123 can be written as 
# the sum of two abundant numbers. However, this upper limit cannot be reduced any 
# further by analysis even though it is known that the greatest number that cannot be 
# expressed as the sum of two abundant numbers is less than this limit.
# 
# Find the sum of all the positive integers which cannot be 
# written as the sum of two abundant numbers.
#
# Answer: 4179871

MAX_INTEGER = 28123


# Brute-force determination of numeric abundance
def is_abundant(value):
    divisors = []

    for i in range(1, value):
        if 0 == value % i:
            divisors.append(i)

    divisor_sum = 0

    for it in divisors:
        divisor_sum += it

    if value < divisor_sum:
        return True
    else:
        return False


abundant_numbers = []
number_list = [False for x in range(MAX_INTEGER + 1)]

# First, generate a list of abundant numbers
for i in range(12, MAX_INTEGER):
    if is_abundant(i):
        abundant_numbers.append(i)

# Next, add each abundant number to every other possible
# abundant number in the vector.
for m in range(len(abundant_numbers)):
    for n in range(len(abundant_numbers)):
        position = abundant_numbers[m] + abundant_numbers[n]
        if position <= MAX_INTEGER:
            number_list[position] = True

# Go through the list of numbers that cannot be expressed as
# two abundant numbers and generate the final sum.
final_sum = 0

for i, v in enumerate(number_list):
    if not v:
        final_sum += i

print ("The final sum is: ", final_sum)
