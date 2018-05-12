#!/usr/bin/python

# Project Euler Problem 55
#
# If we take 47, reverse and add, 47 + 74 = 121, which is palindromic.
#
# Not all numbers produce palindromes so quickly. For example,
#
# 349 + 943 = 1292,
# 1292 + 2921 = 4213
# 4213 + 3124 = 7337
#
# That is, 349 took three iterations to arrive at a palindrome.
#
# Although no one has proved it yet, it is thought that some numbers, like 196, never produce a palindrome.
# A number that never forms a palindrome through the reverse and add process is called a Lychrel number.
# Due to the theoretical nature of these numbers, and for the purpose of this problem, we shall assume that a
# number is Lychrel until proven otherwise. In addition you are given that for every number below ten-thousand,
# it will either (i) become a palindrome in less than fifty iterations, or, (ii) no one, with all the computing
# power that exists, has managed so far to map it to a palindrome. In fact, 10677 is the first number to be shown to
# require over fifty iterations before producing a palindrome: 4668731596684224866951378664 (53 iterations, 28-digits).
#
# Surprisingly, there are palindromic numbers that are themselves Lychrel numbers; the first example is 4994.
#
# How many Lychrel numbers are there below ten-thousand?
#
# Answer: 249

CYCLE_LIMIT = 50
TOTAL_RANGE = 10000


# Takes an integer and reverses the digits in the number
def reverse_value(value):
    forward = str(value)
    reverse = forward[::-1]
    return int(reverse)


# Test if the digits in an integer are palindromic
def is_palindrome(test_value):
    reverse = reverse_value(test_value)
    if test_value == reverse:
        return True
    return False


# Test if an integer is a Lychrel number
def is_lychrel(start_value):
    iteration_value = start_value
    for j in range(1, CYCLE_LIMIT):
        iteration_value = iteration_value + reverse_value(iteration_value)
        if is_palindrome(iteration_value):
            return False

    return True


lychrel_count = 0

for i in range(10, TOTAL_RANGE):
    if is_lychrel(i):
        lychrel_count += 1

print("Lychrel count: ", lychrel_count)

