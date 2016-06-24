#!/usr/bin/python

# Project Euler Problem 52
#
# It can be seen that the number, 125874, and its double, 251748, 
# contain exactly the same digits, but in a different order.
#
# Find the smallest positive integer, x, such that 2
# x, 3x, 4x, 5x, and 6x, contain the same digits.
#
# Answer: 142857

MAXIMUM_VALUE = 1000000


def get_digit_vector(input):
    digits = []

    while input > 0:
        digits.append(input % 10)
        input = int(input / 10)

    return digits


def has_same_digits(input):
    primary = get_digit_vector(input)
    primary.sort()

    for i in range(2, 6 + 1):
        secondary = get_digit_vector(i * input)
        secondary.sort()

        if len(primary) != len(secondary):
            return False

        if primary != secondary:
            return False

    return True


final_answer = 0

for i in range(1, MAXIMUM_VALUE):
    if has_same_digits(i):
        final_answer = i
        break

print ("The target number is: ", final_answer)
